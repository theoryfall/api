"use strict";
const fp = require("fastify-plugin");

const Classes = require("./Classes");
const Disciplines = require("./Disciplines");
const Powers = require("./Powers");
const Races = require("./Races");

const setup = (fastify, opts, next) => {
  fastify.decorate("models", {
    Classes,
    Disciplines,
    Powers,
    Races
  });
  next();
};

module.exports = fp(setup);
