"use strict";
const app = require("fastify")({
  log: process.env.NODE_ENV === "development" ? true : false
});

const envOptions = {
  confKey: "config",
  schema: require("./envSchema")
};

/* PLUGINS */
app.register(require("fastify-env"), envOptions);
app.register(require("fastify-helmet"), {
  hidePoweredBy: { setTo: "PHP 7.2.0" }
});
app.register(require("fastify-jwt"), { secret: process.env.JWT_SECRET });
app.register(
  require("fastify-knex"),
  require("./knexfile")[process.env.NODE_ENV]
);
app.register("fastify-boom");

/* MIDDLEWARE */
app.use(require("./utils/objection"));

app.listen(process.env.PORT, () =>
  console.log("Server up and running on port %s", process.env.PORT)
);
