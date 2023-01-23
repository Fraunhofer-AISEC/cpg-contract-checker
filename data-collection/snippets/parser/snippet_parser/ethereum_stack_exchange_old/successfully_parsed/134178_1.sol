

pragma solidity ^0.8.8;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
 
function getPrice() public view returns(uint256){
        AggregatorV3Interface pricefeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        (,int256 price,,,) = pricefeed.latestRoundData();

        return uint256(price * 1e10);

    }

    function getConversionRate(uint256 ethamount) public view returns(uint256){
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUSD = (ethPrice * ethamount) / (1e18);

        return ethAmountInUSD;
    }

    function getVersion() public view returns (uint256){
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x8A753747A1Fa494EC906cE90E9f37563A8AF630e);
        return priceFeed.version();
    }

}
