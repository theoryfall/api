"use strict";
const Boom = require("boom");

const schema = {
  querystring: {
    page: { type: "number" },
    limit: { type: "number" }
  }
};

const getAllRaces = async function(req, reply) {
  let page = req.query.page ? parseInt(req.query.page, 10) : 1;
  let limit = req.query.limit ? parseInt(req.query.limit, 10) : 1;

  const { Races } = this.models;

  if (page < 0) {
    page = 1;
  } else if (limit < 25) {
    limit = 25;
  } else if (limit > 100) {
    limit = 100;
  }

  const start = (page - 1) * limit,
    end = page * limit - 1;

  let query = Races.query()
    .eager("[disciplines.[powers.[next.^]], classes.[powers.[next.^]]]")
    .range(start, end);

  let races;

  try {
    races = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.message });
  }

  return { races };
};

module.exports = {
  method: "GET",
  url: "/races",
  schema,
  handler: getAllRaces
};
