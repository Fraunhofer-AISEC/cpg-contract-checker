
var simpleStorage = artifacts.require("./SimpleStorage.sol");

contract('SimpleStorage', function(accounts) {

  var contract_instance;

  before(async function() {
    contract_instance = await simpleStorage.new();
  });

  it("owner is the first account", async function(){
    var owner = await contract_instance.owner.call();
    expect(owner).to.equal(accounts[0]);
  });

});
