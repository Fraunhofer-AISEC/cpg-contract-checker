constructor() public {
  _name = {{TOKEN_NAME}};
  _symbol = {{TOKEN_SYMBOL}};
  _decimals = {{DECIMALS}};
  _totalSupply = {{TOTAL_SUPPLY}};
  _balances[msg.sender] = _totalSupply;

  emit Transfer(address(0), msg.sender, _totalSupply);
}
