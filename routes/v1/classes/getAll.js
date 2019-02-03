"use strict";
const Boom = require("boom");
const Classes = require("../../../models/Classes");

const getAllClasses = async function(req, reply) {
  let query = Classes.query().eager(
    "[powers.[next.^], disciplines.[powers], races]"
  );

  let classes;

  try {
    classes = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.message });
  }

  return { classes };
};

module.exports = {
    method: "GET",
    url: "/classes",
    handler: getAllClasses
  };