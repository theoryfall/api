"use strict";
const fs = require("fs");
const path = require("path");
const slugify = require("slugify");
const slugOpts = {
  replacement: "-",
  remove: null,
  lower: true
};

const { convertRomanToNumber } = require("../../utils/helpers");

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

function convert(arr) {
  const pattern = /(ix|iv|v?i{0,3})$/g;
  return arr.map(power => {
    if (pattern.test(power)) {
      const roman = power.match(pattern)[0];
      const name = power.split(pattern)[0];
      power = slugify(name + convertRomanToNumber(roman));
    }
    return power;
  });
}

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
  return new Promise((resolve, reject) => {
    let list = [],
      relations = [];
    const dir = path.resolve("../api/crowfall-data/data/disciplines");
    const stat = fs.statSync(dir);
    if (!stat || !stat.isDirectory()) {
      reject(`${dir} is not a readable directory.`);
    }

    const files = fs.readdirSync(dir);

    for (const file of files) {
      const obj = JSON.parse(fs.readFileSync(`${dir}/${file}`));

      requiredProperties.forEach(propName => {
        if (obj[propName] === undefined) {
          reject(
            `${file} is missing the property of ${propName} or it's invalid.`
          );
        }
      });

      if (list.some(dup => dup.name === obj.name)) {
        reject(`${file}: has a duplicate name property`);
      }

      const slug = slugify(obj.name, slugOpts);

      const {
        stats,
        equips,
        tray_removed,
        tray_granted,
        slots_removed,
        slots_granted
      } = obj;

      const trays_and_slots = JSON.stringify({
        tray_granted,
        tray_removed,
        slots_granted,
        slots_removed
      });

      const created_at = new Date().toISOString();
      const updated_at = created_at;

      list.push({
        name: obj.name,
        description: obj.description,
        slug,
        type: obj.type,
        icon: `http://localhost/assets/images/discipline/${slug}.png`,
        icon_svg: `http://localhost/assets/images/discipline/${slug}.svg`,
        stats: JSON.stringify(stats),
        equips: JSON.stringify(equips),
        trays_and_slots,
        created_at,
        updated_at
      });

      Object.assign(relations, {
        [slug]: {
          classes: obj.classes,
          tags: obj.tags,
          powers: convert(obj.powers)
        }
      });
    }

    resolve({ disciplines: list, relations });
  });
}

module.exports = buildDisciplineList;
