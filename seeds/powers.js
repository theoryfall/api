"use strict";
const slugify = require("slugify");
const fs = require("fs");
const slugOpts = {
  replacement: "-",
  remove: null,
  lower: true
};

function powerList() {
  const path = "../crowfall-data/data/power";

  const list = fs.readdirSync(path);

  const results = [];

  for (const file of list) {
    const obj = JSON.parse(fs.readFileSync(`${path}/${file}`));

    const isCombo = obj.previous_chain.length ? true : false;

    const isDisciplinePower =
      obj.sources.length && obj.sources[0].data_type === "discipline"
        ? true
        : false;

    const slug = slugify(obj.name, slugOpts);

    results.push({
      name: obj.name,
      slug: slug,
      icon: `http:/localhost/assets/images/${slug}.png`,
      icon_svg: `http://localhost/assets/images/${slug}.svg`,
      description: obj.description,
      power_type: obj.type,
      cast_type: obj.cast_type,
      targeting: obj.targeting,
      max_targets: obj.max_targets,
      duration: obj.duration,
      cooldown: obj.cooldown,
      range: obj.range,
      is_discipline_power: isDisciplinePower,
      is_combo: isCombo,
      resource_type: obj.cost.length ? null : obj.cost[0].name,
      resource_cost: obj.cost.length ? null : obj.cost[0].cost
    });
  }

  return results;
}

exports.seed = async function(knex, Promise) {
  // Deletes ALL existing entries
  try {
    await knex.raw("TRUNCATE TABLE powers CASCADE RESTART IDENTITY");
  } catch (err) {
    return Promise.reject(err);
  }

  try {
    await knex.insert(powerList);
  } catch (err) {
    return Promise.reject(err);
  }
};
