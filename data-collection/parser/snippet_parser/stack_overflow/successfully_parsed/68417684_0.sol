pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

AggregatorV3Interface internal priceFeed;


constructor() public {
    priceFeed = AggregatorV3Interface(0x6135b13325bfC4B00278B4abC5e20bbce2D6580e);
}


function getThePrice() public view returns (int) {
    (
        uint80 roundID, 
        int price,
        uint startedAt,
        uint timeStamp,
        uint80 answeredInRound
    ) = priceFeed.latestRoundData();
    return price;
}
}
