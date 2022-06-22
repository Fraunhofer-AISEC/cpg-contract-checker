contract MyCoin is StandardToken {
  string public name = "TOKKA";
  string public symbol = "TOK";
  uint256 public decimals = 18;

  uint256 constant INITIAL_SUPPLY = 1234 * 10**18;

  function StandardToken() public {
    balance[msg.sender] = INITIAL_SUPPLY;
  }
}
