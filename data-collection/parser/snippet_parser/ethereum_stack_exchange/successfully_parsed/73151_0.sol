  function WithdrawDividend(address) public {

    if (!_RestrictedFromDividend[address(msg.sender)]) {
        _SavedDividend[msg.sender] = _balances[address(this)].mul(_balances[address(msg.sender)]).div(100000000);  
        uint256 DividendsToBurn = _SavedDividend[msg.sender].mul(10).div(10000);
        uint256 DividendstoDividend = _SavedDividend[msg.sender].sub(DividendsToBurn);

        _balances[address(this)] = _balances[address(this)].sub(DividendstoDividend).sub(DividendsToBurn);
        _balances[msg.sender] = _balances[msg.sender].add(DividendstoDividend);
        _balances[address(0)] = _balances[address(0)].add(DividendsToBurn);

        _totalSupply = _totalSupply.sub(DividendsToBurn);
                _RestrictedFromDividend[address(msg.sender)] = true;
        ClaimTime[address(msg.sender)] = now;

        emit Transfer(address(this), msg.sender, DividendstoDividend);
        emit Transfer(address(this), address(0), DividendsToBurn);

    }
    else {
        emit Transfer(address(this), msg.sender, 0);
    }
}