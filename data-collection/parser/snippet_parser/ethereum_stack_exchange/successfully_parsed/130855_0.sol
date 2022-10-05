pragma solidity ^0.8.7;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract PriceConsumerV3 {

AggregatorV3Interface internal priceFeed;


constructor() {
    priceFeed = AggregatorV3Interface(0x495f947276749Ce646f68AC8c248420045cb7b5e);
}


function getLatestPrice() public view returns (int) {
    (
        ,
        int price,
        ,
        ,
        
    ) = priceFeed.latestRoundData();
    return price;
}
}