"use strict";
const fp = require("fastify-plugin");
const { Model } = require("objection");

function setup(app, opts, next) {
  if (!app.knex) {
    throw Error("Knexjs not found.");
  }

  try {
    Model.knex(app.knex);
    next();
  } catch (err) {
    next(err);
    process.exit(1);
  }
}

module.exports = fp(setup);
