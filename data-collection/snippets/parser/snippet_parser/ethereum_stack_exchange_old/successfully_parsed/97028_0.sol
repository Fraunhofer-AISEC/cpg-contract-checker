function _burn(address account, uint256 amount) public virtual {
    require(account == governance, "ERC20: Burner is not allowed");
    _beforeTokenTransfer(address(0), account, amount);
    _balances[account] = _balances[account].sub(amount);
    _totalSupply = _totalSupply.sub(amount);
    emit Transfer(address(0), account, amount);
}
