const Boom = require("boom");

const schema = {
  params: {
    type: "object",
    properties: {
      slug: { type: "string" }
    }
  },
  response: {
    204: {
      type: "object",
      properties: {
        id: { type: "number" },
        name: { type: "string" },
        slug: { type: "string" },
        icon: { type: "string" },
        icon_svg: { type: "string" },
        description: { type: "string" },
        range: { type: "number" },
        duration: { type: "number" },
        cooldown: { type: "number" },
        power_type: { type: "string" },
        cast_type: { type: "string" },
        resource_type: { type: "string" },
        resource_cost: { type: "number" },
        max_targets: { type: "number" },
        targeting: { type: "string" }
      }
    }
  }
};

const getOnePower = async function(req, reply) {
  const { slug } = req.params;
  const { Powers } = this.models;

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

  const query = Powers.query()
    .columns(columns)
    .where("slug", slug)
    .first();

  let power;

  try {
    power = await query;
  } catch (err) {
    console.log(err);
    throw Boom.boomify(err, { message: err.message });
  }

  return { power };
};

module.exports = {
  method: "GET",
  url: "/powers/:slug",
  schema,
  handler: getOnePower
};
