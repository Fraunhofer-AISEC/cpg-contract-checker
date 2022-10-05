contract DappToken {
  uint256 public _totalSupply;

  function DappToken () public {
    _totalSupply = 10000000;
  }
  function totalSupply() public view returns (uint256) {
    return _totalSupply;
  }
}
