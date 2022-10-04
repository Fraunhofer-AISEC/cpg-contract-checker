function changeMap() external {
  require(msg.sender == _contractBAddress, 'address not match');
}
