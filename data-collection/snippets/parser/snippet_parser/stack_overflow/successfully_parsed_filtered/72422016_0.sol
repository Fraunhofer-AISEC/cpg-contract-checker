

pragma solidity ^0.6.0;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract ABI {

    AggregatorV3Interface internal priceFeed;

    constructor() public {
        priceFeed = AggregatorV3Interface(0xF4030086522a5bEEa4988F8cA5B36dbC97BeE88c);
    }

    function latestPrice() public view returns (int256) {
        (, int256 answer,,,) = priceFeed.latestRoundData();
        return answer;
    }

}
