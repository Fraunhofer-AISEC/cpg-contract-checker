contract SellToken {
  TokenAbstractInterface instance;
  function SellToken(address _address) {
    instance = TokenAbstractInterface(_address);
  }

  function () payable { 
    uint256 weiAmount = msg.value;

    
    uint256 tokens = weiAmount.mul(rate);

    
    weiRaised = weiRaised.add(weiAmount);

    instance.mint(beneficiary, tokens);
  }

}
