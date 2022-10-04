

function createTokenContract() internal returns (MintableToken) {
  return new SimpleToken();
}
