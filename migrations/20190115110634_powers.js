exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.hasTable("powers").then(function(exists) {
      if (exists) return;
      return knex.schema.createTable("powers", function(t) {
        t.increments("id").primary();
        t.string("name");
        t.string("slug");
        t.string("icon");
        t.string("icon_svg");
        t.text("description");
        t.string("power_type");
        t.string("cast_type");
        t.string("resource_type");
        t.string("resource_cost");
        t.float("cooldown");
        t.float("duration");
        t.integer("max_targets");
        t.float("range");
        t.string("targeting");
        t.boolean("is_discipline_power").defaultTo(false);
        t.boolean("is_combo").defaultTo(false);
        t.boolean("is_deleted").defaultTo(false);
        t.timestamps();
        t.unique("name");
        t.unique("slug");
      });
    }),
    knex.schema.hasTable("power_combos").then(function(exists) {
      if (exists) return;
      return knex.schema.createTable("power_combos", t => {
        t.integer("parent_power_id").references("powers.id");
        t.integer("child_power_id").references("powers.id");
      });
    })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTableIfExists("power_combos"),
    knex.schema.dropTableIfExists("powers")
  ]);
};
