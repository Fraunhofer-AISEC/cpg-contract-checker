contract Recoverable is Ownable {

  
  function Recoverable() public {
  }

  
  
  function recoverTokens(ERC20Basic token) onlyOwner public {
    token.transfer(owner, tokensToBeReturned(token));
  }

  
  
  
  function tokensToBeReturned(ERC20Basic token) public returns (uint) {
    return token.balanceOf(this);
  }
}
