const Boom = require("boom");

const schema = {
  querystring: {
    page: { type: "number" },
    limit: { type: "number" }
  }
};

const getAllPowers = async function(req, reply) {
  let page = req.query.page ? parseInt(req.query.page, 10) : 1;
  let limit = req.query.limit ? parseInt(req.query.limit, 10) : 25;

  const { Powers } = this.models;

  if (page < 1) {
    page = 1;
  } else if (limit < 25) {
    limit = 25;
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

  const start = (page - 1) * limit,
    end = page * limit - 1;

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
