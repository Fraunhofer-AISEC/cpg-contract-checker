contract Contract {
  mapping (address => uint) public balances;

  function myBalance() public view returns(uint) {
    return balances[msg.sender];
  }

  function deposit() external payable {
    balances[msg.sender] += msg.value;
  }
}

contract TestContract {

  function testDeposit() external payable {
    Contract c = new Contract();

    c.deposit.value(1);

    Assert.equal(c.myBalance(), 1, "#myBalance() should returns 1");
  }
}
