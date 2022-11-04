var Leontest1 = artifacts.require("./Leontest1.sol");

contract('Leontest1:low_numbers', function(accounts) {
  it("should assert true", async function() {
    const contract = await Leontest1.deployed();
    await contract.low_numbers(5);
    const result = await contract.low_numbers.call();
    assert.equal(result,"This is a low flight number");

  });
});
