const buildFastify = require("./app");

const app = buildFastify();

app.listen(process.env.PORT, () =>
  console.log("Server up and running on port %s", process.env.PORT)
);
