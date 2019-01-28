"use strict";
const fs = require("fs");
const path = require("path");
const slugify = require("slugify");
const slugOpts = {
  replacement: "-",
  remove: null,
  lower: true
};

const requiredProperties = ["name", "description", "races", "powers"];

function buildClassList() {
  return new Promise(function(resolve, reject) {
    const dir = path.resolve("../api/crowfall-data/data/class");
    const stat = fs.statSync(dir);
    if (!stat || !stat.isDirectory()) {
      reject(`${dir} is not a readable directory.`);
    }

    const files = fs.readdirSync(dir);

    const results = [];

    let relations = {};

    for (const file of files) {
      const obj = JSON.parse(fs.readFileSync(`${dir}/${file}`));

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

      results.push({
        name: obj.name,
        description: obj.description,
        slug,
        icon: `http://localhost/assets/images/class/${slug}.png`,
        icon_svg: `http://localhost/assets/images/class/${slug}.svg`,
        created_at,
        updated_at
      });

      Object.assign(relations, {
        [slug]: {
          race: obj.races,
          tags: obj.tags,
          powers: obj.powers
        }
      });
    }

    resolve({ classes: results, relations });
  });
}

function classMappings(ref, source, relations, type) {
  const results = [];
  const _key = type.replace(/s$/, "").trim();
  Object.entries(relations).forEach(([key, val, index]) => {
    const { id } = ref.find(r => r.slug === key);
    if (!Array.isArray(val[type])) {
      throw new Error("source isn't a valid array.");
    }
    val[type].forEach(v => {
      const match = source.find(s => s.slug === v);
      if (match) {
        results.push({ class_id: id, [`${_key}_id`]: match.id });
      }
    });
  });

  return results;
}

module.exports = { buildClassList, classMappings };
