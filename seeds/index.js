"use strict";
const { buildPowerList, powerRelations } = require("./sources/powers");
const { buildClassList } = require("./sources/classes");
const { buildDisciplineList } = require("./sources/disciplines");

const mappings = function(ref, source, relations, type, parentIdName) {
  const results = [];
  const _key = type.replace(/(es|s)$/, "").trim();
  Object.entries(relations).forEach(([key, val]) => {
    const { id } = ref.find(r => r.slug === key);
    if (!Array.isArray(val[type])) {
      throw new Error("source isn't a valid array.");
    }
    val[type].forEach(v => {
      const match = source.find(s => s.slug === v);
      if (match) {
        results.push({ [parentIdName]: id, [`${_key}_id`]: match.id });
      }
    });
  });

  return results;
};

exports.seed = async function(knex, Promise) {
  let powerRef, classRelations;
  // Deletes ALL existing entries
  try {
    await knex.raw("TRUNCATE TABLE powers RESTART IDENTITY CASCADE");
    await knex.raw("TRUNCATE TABLE classes RESTART IDENTITY CASCADE");
    await knex.raw("TRUNCATE TABLE disciplines RESTART IDENTITY CASCADE");
    await knex.raw("TRUNCATE TABLE races RESTART IDENTITY CASCADE");
  } catch (err) {
    return Promise.reject(err);
  }

  try {
    // SEED powers, power_combos TABLE.
    const { powers, relations } = await buildPowerList();
    const _tableData = await knex
      .insert(powers)
      .into("powers")
      .returning(["id", "slug"]);
    const joinTable = await powerRelations(_tableData, relations);
    await knex.insert(joinTable).into("power_combos");
  } catch (err) {
    console.log(err);
    return Promise.reject(err);
  }

  //save a reference to the parent powers; exclude any children powers in combos.
  try {
    powerRef = await knex("powers")
      .where({ is_combo: false })
      .columns(["id", "slug"]);
  } catch (err) {
    return Promise.reject(err);
  }

  try {
    //SEED classes, class_powers
    const { classes, relations } = await buildClassList();

    classRelations = relations;

    const classPowerPairings = await knex
      .insert(classes)
      .into("classes")
      .returning(["id", "slug"]);

    const classPowers = mappings(
      classPowerPairings,
      powerRef,
      relations,
      "powers",
      "class_id"
    );

    await knex.insert(classPowers).into("class_powers");
  } catch (err) {
    return Promise.reject(err);
  }

  try {
    //SEED disciplines, discipline_powers, discipline_classes
    const { disciplines, relations } = await buildDisciplineList();

    const results = await knex
      .insert(disciplines)
      .into("disciplines")
      .returning(["id", "slug"]);

    const disciplinePowers = mappings(
      results,
      powerRef,
      relations,
      "powers",
      "discipline_id"
    );

    const classes = await knex.select("id", "slug").from("classes");

    const disciplineClassPairings = mappings(
      results,
      classes,
      relations,
      "classes",
      "discipline_id"
    );

    await knex.insert(disciplinePowers).into("discipline_powers");
    await knex.insert(disciplineClassPairings).into("class_disciplines");
  } catch (err) {
    return Promise.reject(err);
  }

  try {
    //SEED races, race_disciplines, class_races
    const races = await knex
      .select("slug", "description", "name")
      .from("disciplines")
      .where({ type: "race" });

    races.map(race => {
      const date = new Date().toISOString();
      race.icon = `http://localhost/assets/images/race/${race.slug}.png`;
      race.icon_svg = `http://localhost/assets/images/race/${race.slug}.svg`;
      race.created_at = date;
      race.updated_at = date;
      return race;
    });

    const source = await knex
      .insert(races)
      .into("races")
      .returning(["id", "slug"]);

    const classes = await knex.select("id", "slug").from("classes");

    const classRacePairings = mappings(
      classes,
      source,
      classRelations,
      "race",
      "class_id"
    );

    const disciplines = await knex
      .select("id", "slug", "type")
      .from("disciplines");

    const raceDisciplines = [];

    disciplines.forEach(disc => {
      const { id } = disc;
      const match = source.find(race => race.slug === disc.slug);
      if (match) {
        raceDisciplines.push({ discipline_id: id, race_id: match.id });
      }
    });
    await knex.insert(classRacePairings).into("class_races");
    await knex.insert(raceDisciplines).into("race_disciplines");
  } catch (err) {
    return Promise.reject(err);
  }
};
