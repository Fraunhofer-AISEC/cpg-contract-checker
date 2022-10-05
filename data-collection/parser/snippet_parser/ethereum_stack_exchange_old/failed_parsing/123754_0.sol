pragma solidity 0.7.6;


import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";
import "contracts/Token.sol";


contract DonateContract {
AggregatorV3Interface internal priceFeed;
address payable owner; 


constructor() {

priceFeed = 
AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526);
owner = payable(msg.sender); 
