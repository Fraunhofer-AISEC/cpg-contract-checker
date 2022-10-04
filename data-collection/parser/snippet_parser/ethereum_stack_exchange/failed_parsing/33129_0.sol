it("SapienToken deployed with SPN symbol", async function() {
    let SPN = await SapienToken.new(TokenController.address, Owned.address);
    let symbol = await SPN.symbol.call();

    assert.equal(symbol, 'SPN', 'Symbol name is not SPN');
});
