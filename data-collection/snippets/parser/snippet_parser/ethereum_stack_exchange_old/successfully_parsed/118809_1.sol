pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract FundMe{

 mapping(address => uint256) public adressToAmountFunded;

 function fund() public payable{
  adressToAmountFunded[msg.sender] += msg.value;
 }  

 function getVersion() public view returns (uint256){
  AggregatorV3Interface priceFeed = AggregatorV3Interface(0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada);
  return priceFeed.version();
 }

 function getPrice() public view returns(uint256,uint8){
  AggregatorV3Interface priceFeed = AggregatorV3Interface(0xd0D5e3DB44DE05E9F294BB0a3bEEaF030DE24Ada);

  (uint80 roundId,
   int256 answer,
   uint256 startedAt,
   uint256 updatedAt,
   uint80 answeredInRound) = priceFeed.latestRoundData();
  return(uint256(answer));    
 }
}
