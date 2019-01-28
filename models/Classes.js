"use strict";
const Model = require("./Base");

class Classes extends Model {
  $beforeInsert(context) {
    super.$beforeInsert(context);
  }

  $beforeUpdate(context) {
    super.$beforeInsert(context);
  }

  static get tableName() {
    return "classes";
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
    const Powers = require("./Powers");
    const Races = require("./Races");
    const Disciplines = require("./Disciplines");
    return {
      powers: {
        relation: Model.ManyToManyRelation,
        modelClass: Powers,
        join: {
          from: "classes.id",
          through: {
            from: "class_powers.class_id",
            to: "class_powers.power_id"
          },
          to: "powers.id"
        }
      },
      races: {
        relation: Model.ManyToManyRelation,
        modelClass: Races,
        join: {
          from: "classes.id",
          through: {
            from: "class_races.class_id",
            to: "class_races.race_id"
          },
          to: "races.id"
        }
      },
      disciplines: {
        relation: Model.ManyToManyRelation,
        modelClass: Disciplines,
        join: {
          from: "classes.id",
          through: {
            from: "class_disciplines.class_id",
            to: "class_disciplines.discipline_id"
          },
          to: "disciplines.id"
        }
      }
    };
  }
}

module.exports = Classes;
