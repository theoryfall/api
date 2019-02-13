"use strict";
const buildFastify = require("../app");
const disciplineTests = require("./routes/disciplines");
const raceTests = require("./routes/races");

describe("initial hooks", function() {
  let app;

  before(function() {
    app = buildFastify();
  });

  after(function() {
    app.close();
  });

  disciplineTests(app);
  raceTests(app);
});
