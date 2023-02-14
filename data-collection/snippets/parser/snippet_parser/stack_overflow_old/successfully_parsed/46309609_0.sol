contract HubiiCrowdsale is Crowdsale {
  uint private constant chunked_multiple = 18000 * (10 ** 18); 
  uint private constant limit_per_address = 100000 * (10 ** 18); 
  uint private constant hubii_minimum_funding = 17000 * (10 ** 18); 
  uint private constant token_initial_supply = 0;
  uint8 private constant token_decimals = 15;
  bool private constant token_mintable = true;
  string private constant token_name = "Hubiits";
  string private constant token_symbol = "HBT";
  uint private constant token_in_wei = 10 ** 15;
  
  uint private constant bonus_base_points = 3000;
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

  
  function setStartingBlock(uint startingBlock) public onlyOwner inState(State.PreFunding) {
      require(startingBlock > block.number && startingBlock < endsAt);
      startsAt = startingBlock;
  }

  function setEndingBlock(uint endingBlock) public onlyOwner notFinished {
      require(endingBlock > block.number && endingBlock > startsAt);
      endsAt = endingBlock;
  }
}