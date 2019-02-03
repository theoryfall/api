"use strict";
const m = {};

const routes = {};

const namespaces = require("require-all")({
  dirname: __dirname,
  filter: /[^index\.js]\w*\.js$/,
  recursive: true
});

Object.entries(namespaces).forEach(([key, _routes]) => {
  routes[key] = { routes: _routes };
});

Object.entries(routes).forEach(([key, _routes]) => {
  Object.values(_routes).forEach(_route => {
    m[key] = function(app, opts, next) {
      Object.values(_route).forEach(routeOpts => app.route(routeOpts));
      next();
    };
  });
});

module.exports = m;
