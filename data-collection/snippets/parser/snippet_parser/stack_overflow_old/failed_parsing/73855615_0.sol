contract A

function deposit() public payable{
  require(msg.value >= 0, "Value amount to be deposit");
  withdraw(msg.value);
}

function withdraw(uint256 _amount) internal{
   uint256 amount = 2 * _amount 
   payable(msg.sender).transfer(amount);
}
