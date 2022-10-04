function forwardFunds(address receiver, uint amount) public {
  require(balances[msg.sender] >= amount);
  balances[msg.sender] -= amount;
  LogFundsForwarded(msg.sender, receiver, amount);
  receiver.transfer(amount); 
}
