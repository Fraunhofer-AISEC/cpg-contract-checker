struct Balances {
    uint256 bEN;
    uint256 bPW;
  }
  mapping(address => Balances) balances;
function balanceOfEN(address _owner) constant returns (uint256 balance) {
    return balances[_owner].bEN;
  }
  function balanceOfPW(address _owner) constant returns (uint256 balance) {
    return balances[_owner].bPW;
  }
