contract TokenFactory {
  function createToken() returns (Token) {
    return new Token();
  }
}
