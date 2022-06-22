 it("should keep the contract owner", async () => {
   let instance = await Example.deployed();
   let address = await instance.getContractOwner.call({from: accounts[0]});
   
   assert.equal(address.valueOf(), "0x67F4CfB03aA5E2E71De1470ae26adB7e33B7892E", "the address is not correct");
 });
