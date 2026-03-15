const HelloWordService = require("./hello-world");

describe("HelloWordService Test", () => {
  const helloWordService = new HelloWordService();

  it("says 'Hello John!' to greet John", () => {
    expect(helloWordService.greet("John")).toBe("Hello John!");
  });

});