contract Silly {
  function unsafePrivateWithdraw(address addr, uint amount) private {
    addr.transfer(amount);
  }
  function safeWithdraw(address addr, uint amount) {
    if (!checkWithdrawConditions) throw; 
    unsafePrivateWithdraw(addr, amount);
  }
}
