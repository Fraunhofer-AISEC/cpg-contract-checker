function burn(uint256 amount) external {
  onlyOwner();
  _burn(msg.sender, amount);
}
