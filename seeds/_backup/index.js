// "use strict";
// const slugify = require("slugify");
// const path = require("path");
// const fs = require("fs");
// const { convertRomanToNumber } = require("../utils/helpers");
// const slugOpts = {
//   replacement: "-",
//   remove: null,
//   lower: true
// };

// const requiredProperties = [
//   "name",
//   "description",
//   "power_type",
//   "cast_type",
//   "duration",
//   "range",
//   "targeting",
//   "max_targets",
//   "sources",
//   "next_chain",
//   "previous_chain",
//   "type",
//   "cooldown"
// ];

// function powerList() {
//   return new Promise((resolve, reject) => {
//     const dir = path.resolve("../api/crowfall-data/data/power");

//     const stat = fs.statSync(dir);

//     if (!stat || !stat.isDirectory()) {
//       reject(new Error(`${dir} is not a directory.`));
//     }

//     const list = fs.readdirSync(dir);

//     const results = [];

//     const relations = [];

//     const pattern = /M{0,4}(CM|CD|D?C{0,3})(XC|XL|L?X{0,3})(IX|IV|V?I{0,3})$/g;

//     for (const file of list) {
//       const obj = JSON.parse(fs.readFileSync(`${dir}/${file}`));

//       requiredProperties.forEach(propName => {
//         if (obj[propName] === undefined) {
//           reject(`${file}'s is missing ${propName} or it's value is invalid.`);
//         }
//       });

//       //check for duplicates.
//       if (results.some(dup => dup.name === obj.name)) {
//         console.log(`Duplciate: ${file}`);
//         console.log(obj);
//         reject("Duplicate Data Found.");
//       }

//       const created_at = new Date().toISOString();
//       const updated_at = created_at;

//       const isCombo = obj.previous_chain.length ? true : false;

//       const isDisciplinePower =
//         obj.sources.length && obj.sources[0].data_type === "discipline"
//           ? true
//           : false;

//       if (pattern.test(obj.name)) {
//         let roman = obj.name.match(pattern);
//         let _name = obj.name.split(pattern);
//         if (roman.length) {
//           obj.name = _name[0] + convertRomanToNumber(roman[0]);
//         }
//       }

//       const slug = slugify(obj.name, slugOpts);

//       results.push({
//         name: obj.name,
//         slug: slug,
//         icon: `http:/localhost/assets/images/${slug}.png`,
//         icon_svg: `http://localhost/assets/images/${slug}.svg`,
//         description: obj.description,
//         power_type: obj.type,
//         cast_type: obj.cast_type,
//         targeting: obj.targeting,
//         max_targets: obj.max_targets,
//         duration: obj.duration,
//         cooldown: obj.cooldown,
//         range: obj.range,
//         is_discipline_power: isDisciplinePower,
//         is_combo: isCombo,
//         resource_type: obj.cost.length ? obj.cost[0].name : "N/A",
//         resource_cost: obj.cost.length ? obj.cost[0].cost : "N/A",
//         created_at,
//         updated_at
//       });

//       relations.push({
//         slug,
//         sources: obj.sources,
//         previous_chain: obj.previous_chain
//       });
//     }

//     resolve({ powers: results, relations });
//   });
// }

// fun

// async function powerRelations(tableData, dataToBeJoined) {
//   const results = [];

//   tableData.forEach(power => {
//     const { slug, id } = power;
//     const match = dataToBeJoined.find(
//       m => m.previous_chain.length && m.previous_chain[0] === slug
//     );

//     if (match) {
//       var child = tableData.find(p => p.slug === match.slug);
//       results.push({ parent_power_id: id, child_power_id: child.id });
//     }
//   });

//   return results;
// }

exports.seed = async function(knex, Promise) {
  // Deletes ALL existing entries
  try {
    await knex.raw("TRUNCATE TABLE powers RESTART IDENTITY CASCADE");
  } catch (err) {
    console.log(err);
    return Promise.reject(err);
  }

  try {
    // SEED powers, power_combos TABLE.
    const { powers, relations } = await powerList();
    const tableData = await knex
      .insert(powers)
      .into("powers")
      .returning(["id", "slug"]);
    const joinTable = await powerRelations(tableData, relations);
    await knex.insert(joinTable).into("power_combos");
    
    // SEED classes, class_powers TABLE.
  } catch (err) {
    console.log(err);
    return Promise.reject(err);
  }
};
