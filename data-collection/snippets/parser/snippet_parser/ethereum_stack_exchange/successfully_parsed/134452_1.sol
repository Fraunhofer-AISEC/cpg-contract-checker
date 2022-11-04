

pragma solidity 0.6.6;

import "@chainlink/contracts/src/v0.6/interfaces/AggregatorV3Interface.sol";
import "@chainlink/contracts/src/v0.6/vendor/SafeMathChainlink.sol";

contract Donation {
    using SafeMathChainlink for uint256;

    uint256 ethAmount;
    address payable owner;
    AggregatorV3Interface public priceFeed;

    constructor(address _priceFeed) public {
        priceFeed = AggregatorV3Interface(_priceFeed);
        owner = msg.sender;
    }

    function donate(uint256 _amount) public payable {
        ethAmount = getConversionRate(_amount);
        owner.transfer(ethAmount);
    }

    function getConversionRate(uint256 rawUSD) public view returns (uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethValue = (rawUSD / ethPrice) * 1000000000000000000;
        return ethValue;
    }

    function getPrice() public view returns (uint256) {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        return uint256(answer * 10000000000);
    }
}
