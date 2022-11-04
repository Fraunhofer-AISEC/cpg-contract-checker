pragma solidity 0.8.0;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

library PriceConverter {
  
  

  function getPrice(AggregatorV3Interface priceFeed)
    internal
    view
    returns (uint256 _price)
  {
    (, int256 price, , , ) = priceFeed.latestRoundData();
    return uint256(price * 1e10);
  }

  function getConversionRate(uint256 ethAmount, AggregatorV3Interface priceFeed)
    internal
    view
    returns (uint256)
  {
    uint256 price = getPrice(priceFeed);
    uint256 ethAmountInUsd = (price * ethAmount) / 1e18;
    return (ethAmountInUsd);
  }
}

pragma solidity 0.8.0;

import "./PriceConverter.sol";

contract Foo {
  using priceConverter for uint256;
  MINIMUM_USD = 7000000000000
  
  function bar() public payable {
     require(msg.value.getConversionRate() > MINIMUM_USD)
  }
function getBalanceInUSD() public view returns (uint256) {
    uint256 balanceInUSD = (balances[msg.sender].getConversionRate(priceFeed));
    return (balanceInUSD);
  }
}

