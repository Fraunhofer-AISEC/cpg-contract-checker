function getBalanceOfToken(address _address) public view returns (unit) {
  return ERC20(_address).balanceOf(address(this));
}
