import "Token.sol";


contract CrowdsaleToken is Token {

  function mint(address _to, uint _amount) public returns (bool) {
      balances[_to] = balances[_to] + _amount;
      return true;
  }

  
}
