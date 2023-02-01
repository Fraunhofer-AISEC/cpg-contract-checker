 function getPrice() public view returns(uint256,uint8){
  AggregatorV3Interface priceFeed = AggregatorV3Interface(0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada);

  (,int256 answer,,,) = priceFeed.latestRoundData();
  return(uint256(answer));    
 }
}
