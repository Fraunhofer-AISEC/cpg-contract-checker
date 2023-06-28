function ViewDividendOwed(address _addr) public view returns (uint256) {
  uint256 _SavedDividend = _balances[address(this)].mul((_balances[msg.sender]).div(_totalSupply));  

  if (ClaimTime[_addr] + 2 minutes <= now) {
    return _SavedDividend;
  }
  else {
    return 0;
  }
}
