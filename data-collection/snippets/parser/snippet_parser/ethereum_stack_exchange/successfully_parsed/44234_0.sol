function transferToMultipleAccounts(address[] _to, uint256 _value) public returns (bool) {

    for (uint i = 0; i < _to.length; i++) {
        transfer(_to[i], _value);
    }

    return true;
  }
