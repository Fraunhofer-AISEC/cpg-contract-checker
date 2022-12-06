contract SimpleToken is StandardToken {

  string public constant name = "FACETOKE";
  string public constant symbol = "FACE";
  uint8 public constant decimals = 18;

  uint256 public constant INITIAL_SUPPLY = 1000000*10**18; 

  function SimpleToken() {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
  }

}
