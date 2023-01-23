  it('can get a slice from a string', async () => {
    let lib = await BKopyStrings.deployed();
    let string = "Now is the time";
    let result = await lib.getSlice(string, 5, 2);
    assert.equal(result,"is", "result should be 'is'");
  })
