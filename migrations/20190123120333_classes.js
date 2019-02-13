exports.up = function(knex, Promise) {
  return Promise.all([
    knex.schema.hasTable("classes").then(exists => {
      if (exists) return;
      return knex.schema.createTable("classes", function(t) {
        t.increments("id").primary();
        t.string("name");
        t.string("slug");
        t.text("description");
        t.string("icon");
        t.string("icon_svg");
        // t.unique("name");
        // t.unique("slug");
        t.timestamps();
      });
    }),
    knex.schema.hasTable("class_powers").then(exists => {
      if (exists) return;
      return knex.schema.createTable("class_powers", function(t) {
        t.integer("class_id").references("classes.id");
        t.integer("power_id").references("powers.id");
      });
    }),
    knex.schema.hasTable("class_disciplines").then(exists => {
      if (exists) return;
      return knex.schema.createTable("class_disciplines", function(t) {
        t.integer("discipline_id").references("disciplines.id");        
        t.integer("class_id").references("classes.id");
      });
    }),
    knex.schema.hasTable("disciplines").then(exists => {
      if (exists) return;
      return knex.schema.createTable("disciplines", function(t) {
        t.increments("id").primary();
        t.string("name");
        t.text("description");
        t.string("slug");
        t.string("icon");
        t.string("icon_svg");
        t.string("type");
        t.jsonb("equips");
        t.jsonb("trays_and_slots");
        t.jsonb("stats");
        t.timestamps();
        // t.unique("name");
        // t.unique("slug");
      });
    }),
    knex.schema.hasTable("discipline_powers").then(exists => {
      if (exists) return;
      return knex.schema.createTable("discipline_powers", function(t) {
        t.integer("discipline_id").references("disciplines.id");
        t.integer("power_id").references("powers.id");
      });
    }),
    knex.schema.hasTable("races").then(exists => {
      if (exists) return;
      return knex.schema.createTable("races", function(t) {
        t.increments("id").primary();
        t.string("name");
        t.string("slug");
        t.string("icon");
        t.string("icon_svg");
        t.text("description");
        t.timestamps();
      });
    }),
    knex.schema.hasTable("race_disciplines").then(exists => {
      if (exists) return;
      return knex.schema.createTable("race_disciplines", function(t) {
        t.integer("discipline_id").references("disciplines.id");        
        t.integer("race_id").references("races.id");
      });
    }),
    knex.schema.hasTable("class_races").then(exists => {
      if (exists) return;
      return knex.schema.createTable("class_races", function(t) {
        t.integer("class_id").references("classes.id");
        t.integer("race_id").references("races.id");
      });
    })
  ]);
};

exports.down = function(knex, Promise) {
  return Promise.all([
    knex.schema.dropTableIfExists("class_powers"),
    knex.schema.dropTableIfExists("class_disciplines"),
    knex.schema.dropTableIfExists("class_races"),
    knex.schema.dropTableIfExists("discipline_powers"),
    knex.schema.dropTableIfExists("race_disciplines"),
    knex.schema.dropTableIfExists("classes"),
    knex.schema.dropTableIfExists("disciplines"),
    knex.schema.dropTableIfExists("races")
  ]);
};
