"use strict";
const Model = require("./Base");

class Disciplines extends Model {
  $beforeInsert(context) {
    super.$beforeInsert(context);
  }

  $beforeUpdate(context) {
    super.$beforeUpdate(context);
  }

  static get tableName() {
    return "disciplines";
  }

  static get jsonSchema() {
    return {
      type: "object",
      required: ["name", "slug", "icon", "icon_svg", "data", "type"],
      properties: {
        id: { type: "integer" },
        name: { type: "string" },
        description: { type: "string" },
        slug: { type: "string" },
        icon: { type: "string" },
        icon_svg: { type: "string" },
        type: { type: "string" },
        data: { type: "json" },
        created_at: { type: "string" },
        updated_at: { type: "string" }
      }
    };
  }

  static get relationMappings() {
    const Powers = require("./Powers");
    const Classes = require("./Classes");
    return {
      powers: {
        relation: Model.ManyToManyRelation,
        modelClass: Powers,
        join: {
          from: "disciplines.id",
          through: {
            from: "discipline_powers.discipline_id",
            to: "discipline_powers.power_id"
          },
          to: "powers.id"
        }
      },
      classes: {
        relation: Model.ManyToManyRelation,
        modelClass: Classes,
        join: {
          from: "disciplines.id",
          through: {
            from: "class_disciplines.discipline_id",
            to: "class_disciplines.class_id"
          },
          to: "classes.id"
        }
      }
    };
  }
}

module.exports = Disciplines;
