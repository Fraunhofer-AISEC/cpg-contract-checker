function HubiiCrowdsale(address _teamMultisig, uint _start, uint _end) Crowdsale(_teamMultisig, _start, _end, hubii_minimum_funding) public {
      PricingStrategy p_strategy = new FlatPricing(token_in_wei);
      CeilingStrategy c_strategy = new FixedCeiling(chunked_multiple, limit_per_address);
      FinalizeAgent f_agent = new BonusFinalizeAgent(this, bonus_base_points, _teamMultisig); 
      setPricingStrategy(p_strategy);
      setCeilingStrategy(c_strategy);
      
      token = new CrowdsaleToken(token_name, token_symbol, token_initial_supply, token_decimals, _teamMultisig, token_mintable);
      token.setMintAgent(address(this), true);
      token.setMintAgent(address(f_agent), true);
      token.setReleaseAgent(address(f_agent));
      setFinalizeAgent(f_agent);
  }
