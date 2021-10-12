const http = require('http');
const port = process.env.PORT || 3000;

const app_type = process.env.APP_TYPE || "unknown";
const hostname = process.env.HOSTNAME || "unknown";
const app_version = process.env.APP_VERSION || "unknown";
const server = http.createServer((req, res) => {
  res.statusCode = 200;
  const msg = `Hello ${app_type}! ${app_version} - ${hostname} \n`
  res.end(msg);
});

server.listen(port, () => {
  console.log(`Server running on http://localhost:${port}/`);
});
