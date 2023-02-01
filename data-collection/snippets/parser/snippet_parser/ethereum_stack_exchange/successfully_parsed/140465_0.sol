function mint(uint256 id, uint256 amount) external payable {
  require(msg.value == 1000000000000000000, "invalid paid amount");
  _safeMint(id,amount);
}
