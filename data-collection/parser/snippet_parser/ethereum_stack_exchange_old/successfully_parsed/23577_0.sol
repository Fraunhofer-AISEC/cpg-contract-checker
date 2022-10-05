SomeToken tok = SomeToken(tokenAddress);
uint tokenBalance = tok.balanceOf(address(this));
tok.transfer(owner, tokenBalance);
