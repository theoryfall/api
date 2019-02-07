"use strict";
const sanitizeHtml = require("sanitize-html");
const fp = require("fastify-plugin");

const sanitizeThis = (obj, opts) => {
  let sanitized;
  Object.entries(obj).forEach(([key, prop]) => {
    if (typeof prop === "object" && !Array.isArray(prop)) {
      sanitized[key] = sanitizeThis(prop, opts);
    } else if (typeof prop === "string") {
      sanitized[key] = sanitizeHtml(prop, opts);
    } else {
      sanitized[key] = prop;
    }
  });
  return sanitized;
};

const sanitizer = (opts => {
  const allowedTags = [];
  const allowedAttributes = {};
  const allowedIframeHostnames = [];
  const textFilter = text => {
    return text.replace(/{{\s*[\w\.]+\s*}}/g, "");
  };
  opts =
    typeof opts === undefined
      ? { allowedTags, allowedAttributes, allowedIframeHostnames, textFilter }
      : opts;
  return function sanitize(req, reply, next) {
    let request = req.query || req.body;
    request = sanitizeThis(request, opts);
    next();
  };
})();

module.exports = fp(function(fastify, opts, next) {
  try {
    fastify.decorate("sanitize", sanitizer);
    next();
  } catch (err) {
    next(err);
    process.exit(1);
  }
});
