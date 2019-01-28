"use strict";
const Model = require("./Base");

class Races extends Model {
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
      required: ["name", "slug", "icon", "icon_svg"],
      properties: {
        id: { type: "integer" },
        name: { type: "string" },
        description: { type: "string" },
        slug: { type: "string" },
        icon: { type: "string" },
        icon_svg: { type: "string" },
        created_at: { type: "string" },
        updated_at: { type: "string" }
      }
    };
  }

  static get relationMappings() {
    const Disciplines = require("./Disciplines");
    const Classes = require("./Classes");
    return {
      disciplines: {
        relation: Model.HasOneThroughRelation,
        modelClass: Disciplines,
        join: {
          from: "races.id",
          through: {
            from: "race_disciplines.race_id",
            to: "race_disciplines.discipline_id"
          },
          to: "disciplines.id"
        }
      },
      classes: {
        relation: Model.ManyToManyRelation,
        modelClass: Classes,
        join: {
          from: "races.id",
          through: {
            from: "class_races.race_id",
            to: "class_races.class_id"
          },
          to: "classes.id"
        }
      }
    };
  }
}

module.exports = Races;
