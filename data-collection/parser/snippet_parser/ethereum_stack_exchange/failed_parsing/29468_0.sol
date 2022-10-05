
 
  function assignTokens(address receiver, uint tokenAmount) private {
    if(!token.transferFrom(beneficiary, receiver, tokenAmount)) throw;
  }
}
