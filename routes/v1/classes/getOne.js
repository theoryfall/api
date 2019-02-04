"use strict";
const Boom = require("boom");

const schema = {
  params: {
    type: "object",
    properties: {
      slug: { type: "string" }
    }
  }
};

const getOneClass = async function(req, reply) {
  const { slug } = req.params;
  const { Classes } = this.models;
  const query = Classes.query()
    .where("slug", slug)
    .eager("[powers.[next.^], disciplines.[powers], races]")
    .first();

  let result;

  try {
    result = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.message });
  }

  return { class: result };
};

module.exports = app => {
  return {
    method: "GET",
    url: "/class/:slug",
    schema,
    beforeHandler: [],
    handler: getOneClass
  };
};
