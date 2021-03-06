"use strict";
const { Model } = require("objection");

class Base extends Model {
  $beforeInsert(context) {
    super.$beforeInsert(context);
    const date = new Date();
    this.created_at = date.toISOString();
  }

  $beforeUpdate(context) {
    super.$beforeUpdate(context);
    const date = new Date();
    this.updated_at = date.toISOString();
  }
}

module.exports = Base;