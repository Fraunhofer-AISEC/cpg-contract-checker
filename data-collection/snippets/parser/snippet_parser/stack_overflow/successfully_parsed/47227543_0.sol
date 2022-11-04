  function balanceOf(address _owner) public constant returns (uint256 balance) {
    return balances[_owner];
  }
