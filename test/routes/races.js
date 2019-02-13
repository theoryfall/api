"use strict";
const buildFastify = require("../app");
const { expect } = require("chai");

describe("RACES", function() {
  describe("GET /races", function() {
    it("return records", async function() {
      const response = await app.inject({
        method: "GET",
        url: "/v1/races"
      });

      const payload = JSON.parse(response.payload);

      expect(response.statusCode).to.equal(200);
      expect(payload)
        .to.be.an("object")
        .that.has.a.property("races");
      expect(payload.races.results).to.be.an("array");
      expect(payload.races.results.length).to.be.above(1);
    });
  });

  describe("GET /races?page=1&limit=50", function() {
    it("return 50 records", async function() {
      const response = await app.inject({
        method: "GET",
        url: "/v1/races/?page=1&limit=50"
      });

      const payload = JSON.parse(response.payload);

      expect(response.statusCode).to.equal(200);
      expect(payload)
        .to.be.an("object")
        .that.has.a.property("races");
      expect(payload.races.results).to.be.an("array");
      expect(payload.races.results.length).to.equal(50);
    });
  });

  describe("GET /races/human", function() {
    it("should return human race", async function() {
      const response = await app.inject({
        method: "GET",
        url: "/v1/races/human"
      });

      const payload = JSON.parse(response.payload);

      expect(response.statusCode).to.equal(200);
      expect(payload)
        .to.be.an("object")
        .that.has.a.property("races");
      expect(payload.race)
        .to.have.a.property("name")
        .that.equal("human");
      expect(payload.race)
        .to.have.a.property("disciplines")
        .that.is.an("array")
        .with.lengthOf(1);
      expect(payload.race)
        .to.have.a.property("classes")
        .that.is.an("array");
      expect(payload.races.classes.length).to.be.above(0);
    });
  });
});
