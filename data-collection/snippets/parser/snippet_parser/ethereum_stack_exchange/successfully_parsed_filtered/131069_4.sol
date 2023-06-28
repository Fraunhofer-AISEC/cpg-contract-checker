pragma solidity ^0.6.7;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";

contract PayToPlay {
    uint256 public cost;

    AggregatorV3Interface internal priceFeed;

    
    constructor() public {
        priceFeed = AggregatorV3Interface(0x9326BFA02ADD2366b30bacB125260Af641031331);
    }

    function getLatestPrice() public view returns (int) {
        (
            uint80 roundID, 
            int price,
            uint startedAt,
            uint timeStamp,
            uint80 answeredInRound
        ) = priceFeed.latestRoundData();
        return price;
    }

    function play() external payable returns(bool) {

        require(
          msg.value == cost / getLatestPrice(),
          'Please send the correct amount of ETH'
        );
    }
}
