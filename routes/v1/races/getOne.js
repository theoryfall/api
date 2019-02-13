"use strict";
const Boom = require("boom");

const getOneRace = async function(req, reply) {
  const { slug } = req.params;
  const { Races } = this.models;

  let query = Races.query()
    .eager("[disciplines.[powers.[next.^]], classes.[powers.[next.^]]]")
    .where("slug", slug)
    .first();

  let race;

  try {
    race = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.message });
  }

  return { race };
};

module.exports = {
  method: "GET",
  url: "/races/:slug",
  handler: getOneRace
};
