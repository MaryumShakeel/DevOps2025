module.exports = {
  testEnvironment: "node",
  testMatch: ["**/tests/**/*.test.js"],
  reporters: [
    "default",
    [
      "jest-junit",
      {
        outputFile: "junit.xml",   // ✅ Jenkins will read this
        suiteName: "Jest Tests",
        ancestorSeparator: " › ",
        usePathForSuiteName: "true"
      }
    ]
  ],
  verbose: true
};
