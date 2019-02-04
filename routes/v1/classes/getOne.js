"use strict";
const Boom = require("boom");

const getOne = async function(req, reply, next) {
  const { slug } = req.params;
  const { Classes } = this.models;
  const query = Classes.query()
    .where("slug", slug)
    .eager("[powers.[next.^], disciplines.[powers], races]");

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
    beforeHandler: [],
    handler: getOne
  };
};
