 

pragma solidity ^0.8.0;

import '@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol';

contract TestContract {

    AggregatorV3Interface internal priceFeed;

    constructor() {
        
        
        priceFeed = AggregatorV3Interface(0x22B58f1EbEDfCA50feF632bD73368b2FdA96D541);
        
    }


    
    function getHistoricalPrice(uint80 roundId) public view returns (int256) {
        (
            , 
            int price,
            ,
            uint timeStamp,
        ) = priceFeed.getRoundData(roundId);
        require(timeStamp > 0, "Round not complete");
        return price;
    }
}
