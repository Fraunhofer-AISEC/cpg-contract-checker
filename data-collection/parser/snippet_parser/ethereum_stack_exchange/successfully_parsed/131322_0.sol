    pragma solidity ^0.8.7;


    contract PriceConsumerV3 {

AggregatorV3Interface internal priceFeed;


constructor() {
    priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
}


function getLatestPrice() public view returns (int) {
    (
        ,
        int price,
        ,
        ,
        
    ) = priceFeed.latestRoundData();
    return price / 10**8;
}
}
