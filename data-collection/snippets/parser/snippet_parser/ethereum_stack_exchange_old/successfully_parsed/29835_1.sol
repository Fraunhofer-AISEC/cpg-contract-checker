function Crowdsale(uint256 _startTime, uint256 _endTime, uint256 _rate, address _wallet) {
    require(_startTime >= now);
    require(_endTime >= _startTime);
    require(_rate > 0);
    require(_wallet != 0x0);

    
    tokenReward = 0xEfCfbc96dc2aDfe35d3fFF6b1D9E985066D618aC;
    startTime = _startTime;
    endTime = _endTime;
    rate = _rate;
    wallet = _wallet;

  }




  function () payable {
    buyTokens(msg.sender);
  }

function buyTokens(address beneficiary) public payable {
    require(beneficiary != 0x0);
    require(validPurchase());

    uint256 weiAmount = msg.value;
    uint256 accessTime = now;

    
    uint256 tokens = weiAmount.mul(rate);

    
    weiRaised = weiRaised.add(weiAmount);


 
tokenReward.transferFrom(0xB1A9B5564071A442909b17f8e9C7288b44aFC014,beneficiary, tokens);
}
