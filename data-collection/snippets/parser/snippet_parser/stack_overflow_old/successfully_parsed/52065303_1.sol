contract TestContract {
  uint public initialBalance = 1 wei;

  function testDeposit() external payable {
    Contract c = new Contract();

    c.deposit.value(1)();

    Assert.equal(c.myBalance(), 1, "#myBalance() should returns 1");
  }
}
