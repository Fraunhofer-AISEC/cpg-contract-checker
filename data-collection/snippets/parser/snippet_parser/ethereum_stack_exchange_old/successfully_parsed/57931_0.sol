function buyTokens(address beneficiary) public payable {

  
  require(beneficiary != 0x0);

  if(hasEnded() && !isHardCapReached)
  {
      if (!isSoftCapReached)
        refundToBuyers = true;
      burnRemainingTokens();
      beneficiary.transfer(msg.value);
  }
  else
  {
    
    require(validPurchase());

    
   uint256 weiAmount = msg.value;

    
    uint256 tokens = weiAmount.mul(rate);

    require (tokens>=500 * 10 ** 18);

    
    uint bonus = determineBonus(tokens);
    tokens = tokens.add(bonus);

    
    require(tokens_sold + tokens <= maxTokensForSale * 10 ** 18);

    
    updateTokensForCloudexchangeTeam(tokens);

    weiRaised = weiRaised.add(weiAmount);


    if (weiRaised >= softCap * 10 ** 18 && !isSoftCapReached)
    {
      isSoftCapReached = true;
    }

    if (weiRaised >= hardCap * 10 ** 18 && !isHardCapReached)
      isHardCapReached = true;

    token.mint(wallet, beneficiary, tokens);

    uint olderAmount = usersThatBoughtCXT[beneficiary];
    usersThatBoughtCXT[beneficiary] = weiAmount + olderAmount;

    emit TokenPurchase(msg.sender, beneficiary, weiAmount, tokens);

    tokens_sold = tokens_sold.add(tokens);
    forwardFunds();
  }
 }

  
  function forwardFunds() internal {
    wallet.transfer(msg.value);
  }

  
  function validPurchase() internal constant returns (bool) {
    bool withinPeriod = now >= startTime && now <= endTime;
    bool nonZeroPurchase = msg.value != 0;
    return withinPeriod && nonZeroPurchase;
  }

  
  function hasEnded() public constant returns (bool) {
    return now > endTime;
  }
