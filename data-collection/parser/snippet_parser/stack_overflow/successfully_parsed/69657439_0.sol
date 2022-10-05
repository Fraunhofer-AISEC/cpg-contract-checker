  function _getTokenAmount(uint weiAmount) internal override view returns(uint256) {
      super._getTokenAmount(weiAmount);
      int currentPrice = priceFeed.getLatestPrice();
      uint weiToEightDec = weiAmount / (10 * 10 ** 10);
      uint exchangeRatePerWei = 1000000000000000000 / uint(currentPrice)  ;
      uint usdAmount = weiToEightDec* exchangeRatePerWei;
      uint amountToGive = usdAmount * 25;
      return(amountToGive);
  }
