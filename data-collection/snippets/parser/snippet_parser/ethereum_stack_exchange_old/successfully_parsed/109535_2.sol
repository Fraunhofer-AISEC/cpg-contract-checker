
function stake() public payable {
  
  require(msg.value >= PRICE_YOU_WANT, "You did not send enough ETH");

  
  
  stakerAmt[msg.sender] += msg.value;
  
  
  
}
