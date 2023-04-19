constructor() public { 
    _name = (PITCROIN);
    _decimals = (2);
    _totalSupply = (100);
    _balances[msg.sender] = _totalSupply;

    emit Transfer(address(0), msg.sender, _totalSupply);
