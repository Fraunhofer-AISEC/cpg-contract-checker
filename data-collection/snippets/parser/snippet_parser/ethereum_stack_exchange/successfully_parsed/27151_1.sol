contract SellToken {
  TokenInstance instance;
  function SellToken(address _address) {
    instance = TokenInstance(_address);
  }

  function () payable { 
    uint256 weiAmount = msg.value;

    
    uint256 tokens = weiAmount.mul(rate);

    
    weiRaised = weiRaised.add(weiAmount);

    instance.mint(beneficiary, tokens);
  }

}
