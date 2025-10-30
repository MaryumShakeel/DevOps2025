module.exports = {
  testEnvironment: "node",
  reporters: [
    "default",
    ["jest-junit", { outputFile: "test-results/junit.xml" }]
  ]
}
