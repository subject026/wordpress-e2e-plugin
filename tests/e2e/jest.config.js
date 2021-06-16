module.exports = {
  ...require("@wordpress/scripts/config/jest-e2e.config"),
  setupFilesAfterEnv: [
    "<rootDir>/config/setup-test-framework.js",
    "@wordpress/jest-console",
    "@wordpress/jest-puppeteer-axe",
    "expect-puppeteer"
  ],
  // globals: {
  //   URL: "http://localhost:8888"
  // },
  testPathIgnorePatterns: ["/node_modules/"],
  testMatch: ["**/**/*.spec.js"],
  verbose: true
};
