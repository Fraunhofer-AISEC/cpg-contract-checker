it("should verify that the account[0] is owner of the token 0", async function(){
    const instance = await NFTToken.deployed();
    const tx = await instance.createCollectible();
    const tokenId = await instance.createCollectible.call();
    const owner = await instance.ownerOf(tokenId);
    assert.equal(owner, accounts[0], "Owner not correct");
});
