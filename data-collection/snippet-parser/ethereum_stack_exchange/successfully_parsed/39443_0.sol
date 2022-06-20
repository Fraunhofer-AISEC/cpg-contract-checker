function forwardFunds(address receiver, uint amount) public {
  require(balances[msg.sender] >= amount);
  receiver.transfer(amount); 
  balances[receiver] -= amount;
  LogFundsForwarded(msg.sender, receiver, amount);
}
