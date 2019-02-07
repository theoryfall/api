"use strict";
const Boom = require("boom");

const getAllDisciplines = async function(req, reply) {
  let page = req.query.page ? parseInt(req.query.page, 10) : 1;
  let limit = req.query.limit ? parseInt(req.query.limit, 10) : 25;

  console.log(page);
  console.log(limit);

  const { Disciplines } = this.models;

  // if (!page || page < 0) {
  //   page = 1;
  // } else if (!limit || limit < 25) {
  //   limit = 25;
  // } else if (limit > 100) {
  //   limit = 100;
  // }

  const start = (page - 1) * limit,
    end = page * limit - 1;

  let query = Disciplines.query().range(start, end);

  let disciplines;

  try {
    disciplines = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.response });
  }

  return { disciplines };
};

module.exports = {
  method: "GET",
  url: "/disciplines",
  handler: getAllDisciplines
};
