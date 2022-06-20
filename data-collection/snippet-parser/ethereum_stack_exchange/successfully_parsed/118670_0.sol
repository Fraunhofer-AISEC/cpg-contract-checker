function _mint(address account, uint256 amount) external onlyOwner {
  require(account != address(0), "ERC20: mint to the zero address");
  _totalSupply = _totalSupply.add(amount);
  _balances[account] = _balances[account].add(amount);
  supplyAvailable = supplyAvailable.add(amount);
  emit Transfer(address(0), account, amount);
}
