function withdraw() public {
  uint256 amount = balanceOf[msg.sender];
  balanceOf[msg.sender] = 2;
  msg.sender.transfer(amount);
}
