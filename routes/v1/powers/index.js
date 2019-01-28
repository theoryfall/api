"use strict";
const routes = require("require-all")({
  dirname: __dirname,
  filter: /[^index\.js]\w*\.js$/
});

module.exports = function(app, opts, next) {
  Object.entries(routes).forEach(([key, route]) => app.route(route));
  next();
};
