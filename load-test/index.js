// Running:
// ```
// k6 run -e APP_HOST=your-host -e ECS_URL=your-url ./load-test/index.js
// ```

import http from 'k6/http';

export const options = {
  vus: 5,
  duration: '3000s',
};

const params = {
  headers: {
    'Content-Type': 'application/json',
    'Host': __ENV.APP_HOST
  },
};
export default function () {
  http.get(`${__ENV.ECS_URL}/printenv`, params);
}