const express = require("express");
const fs = require("fs");
const path = require("path");
const { v4: uuidv4 } = require("uuid");

const app = express();
const PORT = 8080;
const EFS_DIR = "/mnt/efs";

app.use(express.json());
app.use(express.raw({ type: "*/*", limit: "50mb" }));

app.get("/version", (req, res) => {
  res.send("v2");
});

app.get("/healthcheck", (req, res) => {
  res.send("ok");
});

app.get("/files", (req, res) => {
  fs.readdir(EFS_DIR, (err, files) => {
    if (err) {
      console.log(err);
      return res.status(500).json({
        error: "Can't read directory",
      });
    }

    const fileNames = [];
    files.forEach((file) => {
      const filePath = path.join(EFS_DIR, file);
      if (fs.statSync(filePath).isFile()) {
        fileNames.push(file);
      }
    });

    res.json({
      files: fileNames,
    });
  });
});

app.post("/files", (req, res) => {
  const id = uuidv4();
  const content = req.body;

  const filePath = path.join(EFS_DIR, `${id}.txt`);

  fs.writeFile(filePath, content, (err) => {
    if (err) {
      console.log(err);
      return res.status(500).json({
        error: "Can't write file",
      });
    }

    res.json({
      message: "File saved successfully",
      file: filePath,
    });
  });
});

app.get("/files/:uuid", (req, res) => {
  const id = req.params.uuid;

  if (!isValidUUID(id)) {
    return res.status(400).json({
      error: "Invalid UUID",
    });
  }

  const filePath = path.join(EFS_DIR, `${id}.txt`);

  fs.readFile(filePath, (err, data) => {
    if (err) {
      if (err.code === "ENOENT") {
        return res.status(404).json({
          error: "File not found",
        });
      }
      console.log(err);
      return res.status(500).json({
        error: "Can't read file",
      });
    }

    res.send(data.toString());
  });
});

app.get("/printenv", (req, res) => {
  const envVars = Object.entries(process.env).map(
    ([key, value]) => `${key}=${value}`
  );
  res.json(envVars);
});

app.get("/burn-cpu", (req, res) => {
  const duration = parseInt(req.query.duration) || 5;
  const safeDuration = Math.min(duration, 30);

  console.log(`Starting CPU burn for ${safeDuration} seconds`);
  const startTime = Date.now();
  const endTime = startTime + (safeDuration * 1000);

  while (Date.now() < endTime) {
    for (let i = 0; i < 1000000; i++) {
      Math.sqrt(Math.random() * 10000) * Math.sin(Math.random() * 10000);
    }
  }

  const actualDuration = (Date.now() - startTime) / 1000;

  res.json({
    message: `CPU burn completed`,
    requested_duration_seconds: safeDuration,
    actual_duration_seconds: actualDuration.toFixed(2)
  });
});

function isValidUUID(str) {
  const uuidRegex =
    /^[0-9a-f]{8}-[0-9a-f]{4}-[1-5][0-9a-f]{3}-[89ab][0-9a-f]{3}-[0-9a-f]{12}$/i;
  return uuidRegex.test(str);
}

app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
