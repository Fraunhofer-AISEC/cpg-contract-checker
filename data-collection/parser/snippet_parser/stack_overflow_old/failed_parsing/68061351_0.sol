function withdraw(uint amount) external {
  uint balance = wallets[msg.sender];
  require(balance >= amount, "Pool: not enough balance");
  ....
