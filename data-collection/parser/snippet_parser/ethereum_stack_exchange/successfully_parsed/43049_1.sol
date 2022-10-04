contract StandardToken is Token {
    mapping (address => uint256) balances;

    function balanceOf(address _owner) constant returns (uint256) {
        return balances[_owner];
    }
  }
