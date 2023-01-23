constructor() public {
  _name = "MyToken";
  _symbol = "MyT";
  _decimals = 18;
  _totalSupply = 1000000000000000000;
  _balances[msg.sender] = _totalSupply;

  emit Transfer(address(0), msg.sender, _totalSupply);
}
