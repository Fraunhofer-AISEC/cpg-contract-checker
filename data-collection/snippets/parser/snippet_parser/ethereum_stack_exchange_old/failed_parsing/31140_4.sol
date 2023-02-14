  function buyTokens(address beneficiary) public payable {
    require(beneficiary != address(0));
    require(validPurchase());
    ...


  function validPurchase() internal constant returns (bool) {
    return true;
    
    
    
  }
