"use strict";
const app = require("fastify")({
  logger: process.env.NODE_ENV === "development" ? true : false
});

// const envOptions = {
//   confKey: "config",
//   schema: require("./envSchema")
// };

/* PLUGINS */
// app.register(require("fastify-env"), envOptions);
app.register(require("fastify-helmet"), {
  hidePoweredBy: { setTo: "PHP 7.2.0" }
});
// app.register(require("fastify-jwt"), { secret: process.env.JWT_SECRET });
app.register(
  require("fastify-knexjs"),
  require("./knexfile")[process.env.NODE_ENV]
);
app.register(require("fastify-boom"));

/* MIDDLEWARE */
app.register(require("./utils/objection"));

/* ROUTES */
// app.register(require("./routes/v1/powers"), { prefix: "/v1" });
// app.register(require("./routes/v1/classes"), { prefix: "/v1" });
app.register(require("./routes/v1")["powers"], { prefix: "/v1" });
app.register(require("./routes/v1")["classes"], { prefix: "/v1" });


app.listen(process.env.PORT, () =>
  console.log("Server up and running on port %s", process.env.PORT)
);
