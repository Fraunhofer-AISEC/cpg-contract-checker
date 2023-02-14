pragma solidity ^0.8.2;

contract MyContract {
  address payable public owner;

  constructor(address oracleAddress) {
    owner = msg.sender;
    priceFeed = AggregatorV3Interface(oracleAddress);
  }
}