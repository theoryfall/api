"use strict";
const m = {};

const routes = require("require-all")({
  dirname: __dirname,
  filter: /[^index\.js]\w*\.js$/,
  recursive: true
});

Object.keys(routes).forEach(key => {
  m[key] = function(app, opts, next) {
    Object.values(routes[key]).forEach(route => {
      typeof route === "function" ? app.route(route(app)) : app.route(route);
    });
    next();
  };
});

module.exports = m;
