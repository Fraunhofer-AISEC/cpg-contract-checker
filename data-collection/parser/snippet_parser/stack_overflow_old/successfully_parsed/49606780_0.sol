contract MyToken is BasicToken, Ownable {
  uint256 public constant INITIAL_SUPPLY = 10000;

  function MyToken() {
    totalSupply = INITIAL_SUPPLY;
    balances[msg.sender] = INITIAL_SUPPLY;
    Transfer(0x0, msg.sender, INITIAL_SUPPLY);
  }
}
