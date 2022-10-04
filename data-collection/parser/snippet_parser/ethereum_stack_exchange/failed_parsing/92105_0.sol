contract MyContract {
  uint public priceUSD = 1.70 * 10**8; 
  uint public priceEth;

   .........


  function setPrice(uint newPriceUSD) external ownerOnly() returns(uint, uint) {
    uint priceUSDInt = newPriceUSD * 10**8;
    

    

    int price = 132556000000;

    
    
    
    priceEth = priceUSDInt / uint(price) * 10**8;

    
    priceUSD = txtPriceUSDInt;

    
    return (newTxtPriceUSD, priceEth);
  }

  function getLatestPrice() public view returns (int, uint8) {
    (
      ,int price,,,
    ) = priceFeed.latestRoundData(); 

    uint8 decimals = priceFeed.decimals();
    return (price, decimals);
  }

  .........
}
