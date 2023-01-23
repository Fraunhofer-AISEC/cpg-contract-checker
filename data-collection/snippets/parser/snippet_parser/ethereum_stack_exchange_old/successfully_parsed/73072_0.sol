function ViewDividendOwed(address) public view returns (uint256) {      
  if (!RestrictedFromDividend[msg.sender]) {
    return _balances[address(this)].div(100000000).mul(_balances[msg.sender]);
  } else {
    return 0;
  }
}
