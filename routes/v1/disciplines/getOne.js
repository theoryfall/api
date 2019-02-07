"use strict";
const Boom = require("boom");

const getSingleDiscipline = async function(req, reply) {
  const { slug } = req.params;
  const { Disciplines } = this.models;

  const query = Disciplines.query()
    .eager("[powers.[next.^], classes]")
    .where("slug", slug)
    .first();

  let discipline;

  try {
    discipline = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.message });
  }

  return { discipline };
};

module.exports = {
  method: "GET",
  url: "/disciplines/:slug",
  handler: getSingleDiscipline
};
