 function getLatestPrice() public view returns (int, uint8) {
    (
      uint80 roundID,
      int price,
      uint startedAt,
      uint timeStamp,
      uint80 answeredInRound
  ) = priceFeed.latestRoundData();

    uint8 decimals = priceFeed.decimals();
    return (price, decimals);
  }


  function priceInEth() external view returns (uint) {
      uint txtPriceUsd = 2;
      (int price, uint8 decimals) = getLatestPrice();

      
      return price / txtPriceUsd;
  }
