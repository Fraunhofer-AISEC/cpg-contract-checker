const assetTracker = artifacts.require("AssetTracker");

contract("AssetTracker contract test", async accounts => {
  it("should register an item", async () => {
    let instance = await assetTracker.deployed();
    await instance.registerItem("Barcode", "13456-fgs", "This is the first dummy item.", { from: accounts[0]});
    assert.equal(await instance.getItemByToken(1), ["Barcode", "13456-fgs", "This is the first dummy item."]);
    
  });

});
