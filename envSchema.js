module.exports = {
  type: "object",
  required: ["PORT", "JWT_SECRET", "NODE_ENV"],
  properties: {
    PORT: {
      type: "integer",
      default: 3000
    },
    NODE_ENV: {
      type: "string",
      default: "development"
    },
    JWT_SECRET: {
      type: "string",
      default: "nohippies00"
    }
  }
};
