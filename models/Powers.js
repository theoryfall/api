const Model = require("./Base.js");

class Powers extends Model {
  $beforeInsert(context) {
    super.$beforeInsert(context);
  }

  $beforeUpdate(context) {
    super.$beforeInsert(context);
  }

  static get tableName() {
    return "powers";
  }

  static get jsonSchema() {
    return {
      type: "object",
      required: ["name", "slug", "description", "icon", "icon_svg"],
      properties: {
        id: { type: "integer" },
        name: { type: "string" },
        slug: { type: "string" },
        description: { type: "string" },
        icon: { type: "string" },
        icon_svg: { type: "string" },
        power_type: { type: "string" },
        cast_type: { type: "string" },
        resource_type: { type: "string" },
        resource_cost: { type: "string" },
        cooldown: { type: "integer" },
        duration: { type: "integer" },
        max_targets: { type: "integer" },
        range: { type: "integer" },
        targeting: { type: "string" },
        is_discipline_power: { type: "boolean" },
        is_combo: { type: "boolean" },
        created_at: { type: "string" },
        updated_at: { type: "string" }
      }
    };
  }

  static get relationMappings() {
    return {
      next: {
        relation: Model.ManyToManyRelationThrough,
        modelClass: __filename,
        join: {
          from: "powers.id",
          through: {
            from: "power_combos.parent_power_id",
            to: "power_combos.child_power_id"
          },
          to: "powers.id"
        }
      },
      previous: {
        relation: Model.ManyToManyRelationThrough,
        modelClass: __filename,
        join: {
          from: "powers.id",
          through: {
            from: "power_combos.child_power_id",
            to: "powers_combos.parent_power_id"
          },
          to: "powers.id"
        }
      }
    };
  }
}

module.exports = Powers;