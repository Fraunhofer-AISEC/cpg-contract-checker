function sell(uint256 amount) payable public  {
   msg.sender.transfer(msg.value);        
}
