contract Crowdsale {

    

    function buyTokens(address beneficiary) public payable {
        require(beneficiary != 0x0);
        require(validPurchase());

        
        token.mint(beneficiary, tokens); 
        
  }
}
