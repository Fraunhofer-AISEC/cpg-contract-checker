
pragma solidity ^0.5.5;

import "@chainlink/contracts/src/v0.5/interfaces/AggregatorV3Interface.sol";

contract MyRate {
    
    AggregatorV3Interface internal priceFeed;

    
    constructor() public {
        priceFeed = AggregatorV3Interface(0x2514895c72f50D8bd4B4F9b1110F0D6bD2c97526);
    }

    function getRate() public view returns (int) {
        (
            uint80 roundID,
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        price = price / 10 ** 6; 
        price = 1000000000000000000 / price; 
        uint256 a = 10000000000000000000/uint256(85); 
        uint256 exchangeRate = a / uint256(price); 
        return int256(exchangeRate);
    }
}
