function pay(address receiver) payable returns(bool success) {
  
  balance[msg.sender] += paid;
  return true;
}

function claim() returns(bool success) {
  if(balance[msg.sender]==0) throw;
  uint amount = balance[msg.sender];
  msg.sender.transfer(amount);
  return true;
}
