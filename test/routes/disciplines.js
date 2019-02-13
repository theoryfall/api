"use strict";
const buildFastify = require("../app");
const { expect } = require("chai");

describe("hooks", function() {
  let app;
  before(function() {
    app = buildFastify();
  });

  after(function() {
    app.close();
  });

  describe("GET /disciplines", function() {
    it("return records", async function() {
      const response = await app.inject({
        method: "GET",
        url: "/v1/disciplines"
      });

      const payload = JSON.parse(response.payload);

      expect(response.statusCode).to.equal(200);
      expect(payload)
        .to.be.an("object")
        .that.has.a.property("disciplines");
      expect(payload.disciplines.results).to.be.an("array");
      expect(payload.disciplines.results.length).to.be.above(1);
    });
  });

  describe("GET /disciplines?page=1&limit=50", function() {
    it("return 50 records", async function() {
      const response = await app.inject({
        method: "GET",
        url: "/v1/disciplines/?page=1&limit=50"
      });

      const payload = JSON.parse(response.payload);

      console.log(payload);
      
      expect(response.statusCode).to.equal(200);
      expect(payload)
        .to.be.an("object")
        .that.has.a.property("disciplines");
      expect(payload.disciplines.results).to.be.an("array");
      expect(payload.disciplines.results.length).to.equal(50);
    });
  });
});
