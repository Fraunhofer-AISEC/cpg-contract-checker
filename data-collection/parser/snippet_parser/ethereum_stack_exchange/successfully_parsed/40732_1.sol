function withdraw() public {
  uint256 amount = balanceOf[msg.sender];
  msg.sender.transfer(amount);
  balanceOf[msg.sender] = 0;
}
