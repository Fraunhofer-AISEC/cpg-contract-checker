const Storage = artifacts.require("./Storage.sol");

contract('Storage', function(accounts) {
  let storage;
  before(async () => {
    storage = await Storage.deployed();
  });
  it("Set user data", async () => {
    
    await storage.setUserData(4321, 7890);
    
    const data = await storage.getUserData.call(4321);
    assert.equal(data[0], 7890, 'Return user data');
    
    const allData = await storage.allData.call(0);
    assert.equal(allData, 4321, 'Return userId');
  });
});
