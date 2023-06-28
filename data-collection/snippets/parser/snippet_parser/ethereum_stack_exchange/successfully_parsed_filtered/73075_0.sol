function WithdrawDividend(address, uint256 value) public {

  require(value <= _balances[msg.sender]);

  if (!RestrictedFromDividend[msg.sender]) {

    _SavedDividend[msg.sender] = 
    _balances[address(this)].mul(value).div(100000000);  
    uint256 DividendsToBurn = _SavedDividend[msg.sender].mul(10).div(10000);
    uint256 DividendstoDividend = _SavedDividend[msg.sender].sub(DividendsToBurn);

    _balances[address(this)] = _balances[address(this)].sub(DividendstoDividend).sub(DividendsToBurn);
    _balances[msg.sender] = _balances[msg.sender].add(DividendstoDividend);
    _balances[address(0)] = _balances[address(0)].add(DividendsToBurn);

    emit Transfer(address(this), msg.sender, DividendstoDividend);
    emit Transfer(address(this), address(0), DividendsToBurn);

    _SavedDividend[msg.sender] = 0;

    RestrictedFromDividend[msg.sender] = true;

    ClaimTime[msg.sender] = now;
  }
}
