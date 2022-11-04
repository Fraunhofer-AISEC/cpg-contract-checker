contract("Exams", async accounts => {
  it("should pass this test", async () => {
    assert.equal("0", "0", "LOGICAL!")
  });
  it("should keep the contract owner", async () => {

    let instance = await Exam.deployed();
    let address = instance.getContractOwner.call(accounts[0]);
    
    assert.equal(address.valueOf(), "0x67F4CfB03aA5E2E71De1470ae26adB7e33B7892E", "the address is not correct");

  });
});
