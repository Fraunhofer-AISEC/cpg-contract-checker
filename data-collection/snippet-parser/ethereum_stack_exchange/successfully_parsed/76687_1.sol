uint256 _SavedDividend = _balances[address(this)].mul(
    (_balances[msg.sender]).div(_totalSupply)
);
