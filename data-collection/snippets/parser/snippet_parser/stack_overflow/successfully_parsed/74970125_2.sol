pragma solidity ^0.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract Example {
    AggregatorV3Interface internal priceFeed;

    constructor(address _aggregator) {
        priceFeed = AggregatorV3Interface(_aggregator);
    }
}
