  contract DonateContract {
  AggregatorV3Interface internal priceFeed;


  address payable owner; 
  
  
  constructor() {
    priceFeed = AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526);
    owner = payable(msg.sender); 
  }

  
  function donate(uint256 _payAmount) public payable  {
      (bool success,) = owner.call{value: _payAmount}("");
      require(success, "Failed to send money");
      CRON token = CRON(0x1Fdd591131AB310F6eF4B6Fd67103FF3fA264A29); 
      (,int price,,,) = priceFeed.latestRoundData();
      int cost =  int(_payAmount) * 6 * price ;
      token.transfer(owner,uint256(cost)); 
  } 
} 
