"use strict";
const fs = require("fs");
const path = require("path");
const slugify = require("slugify");
const slugOpts = {
  replacement: "-",
  remove: null,
  lower: true
};

const requiredProperties = [
  "name",
  "description",
  "classes",
  "powers",
  "slots_granted",
  "slots_removed",
  "type",
  "tags",
  "stats",
  "equips",
  "tray_granted",
  "tray_removed"
];

function walk(dir) {
  var results = [];
  var list = fs.readdirSync(dir);
  list.forEach(function(file) {
    file = dir + "/" + file;
    var stat = fs.statSync(file);
    if (stat && stat.isDirectory()) results = results.concat(walk(file));
    else results.push(file);
  });
  return results;
}

function buildDisciplineList() {
  return new Promise(function(resolve, reject) {
    const results = [];

    let relations = {};

    const dir = path.resolve("../api/crowfall-data/data/discipline");

    for (const file of walk(dir)) {
      const obj = JSON.parse(fs.readFileSync(file));

      requiredProperties.forEach(propName => {
        if (obj[propName] === undefined) {
          reject(
            `${file} is missing the property of ${propName} or it's invalid.`
          );
        }
      });

      if (results.some(dup => dup.name === obj.name)) {
        reject(`${file}: has a duplicate name property`);
      }

      const slug = slugify(obj.name, slugOpts);

      const created_at = new Date().toISOString();
      const updated_at = created_at;

      const data = JSON.stringify({
        slots_granted: obj.slots_granted,
        slots_removed: obj.slots_removed,
        stats: obj.stats,
        equips: obj.equips,
        tray_granted: obj.tray_granted,
        tray_removed: obj.tray_removed
      });

      results.push({
        name: obj.name,
        description: obj.description,
        slug,
        type: obj.type,
        icon: `http://localhost/assets/images/discipline/${slug}.png`,
        icon_svg: `http://localhost/assets/images/discipline/${slug}.svg`,
        data,
        created_at,
        updated_at
      });

      Object.assign(relations, {
        [slug]: {
          classes: obj.classes,
          tags: obj.tags,
          powers: obj.powers
        }
      });
    }

    resolve({ disciplines: results, relations });
  });
}

module.exports = { buildDisciplineList };
