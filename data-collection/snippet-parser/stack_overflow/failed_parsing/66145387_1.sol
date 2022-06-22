contract('Test', (accounts) => {
  it('should init', async () => {
  
    const instance = await Test.new("test");
    const result = await instance.test;
    assert.equal("test", result, "info is not equals");
  });
});
