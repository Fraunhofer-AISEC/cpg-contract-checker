function sendFunds() public payable {
  require(msg.value >= 1 ether); 
  
}
