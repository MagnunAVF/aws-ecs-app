FROM node:22-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:22-alpine
WORKDIR /app
RUN mkdir -p /mnt/efs && chown -R node:node /mnt/efs
USER node
COPY --from=build --chown=node:node /app/node_modules /app/node_modules
COPY --chown=node:node . .
EXPOSE 8080
ENV NODE_ENV=production

CMD ["node", "index.js"]