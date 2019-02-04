const Boom = require("boom");

const schema = {
  querystring: {
    page: { type: "integer" },
    limit: { type: "integer" }
  }
};

const getAllPowers = async function(req, reply) {
  let currentPage = parseInt(req.query.page, 10);
  let limit = parseInt(req.query.limit, 10);

  const { Powers } = this.models;

  if (!currentPage || currentPage < 1) {
    currentPage = 1;
  } else if (!limit || limit < 25) {
    limit = 25;
  } else if (limit > 100) {
    limit = 100;
  }

  const columns = [
    "id",
    "name",
    "slug",
    "icon",
    "icon_svg",
    "description",
    "range",
    "duration",
    "cooldown",
    "power_type",
    "cast_type",
    "resource_type",
    "resource_cost",
    "max_targets",
    "targeting"
  ];

  const start = (currentPage - 1) * limit,
    end = currentPage * limit - 1;

  let query = Powers.query()
    .columns(columns)
    .eager("next.^")
    .where("is_combo", false)
    .range(start, end);

  try {
    powers = await query;
  } catch (err) {
    throw Boom.boomify(err, { message: err.message });
  }

  return { powers };
};

module.exports = {
  method: "GET",
  url: "/powers",
  schema,
  handler: getAllPowers
};
