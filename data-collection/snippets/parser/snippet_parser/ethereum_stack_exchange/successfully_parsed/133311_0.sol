    function getUniversalConversionRate(uint256 coinAmount,address priceFeedAddress) 
    public view returns (uint256) {
        uint256 coinPrice = getUniversalPrice(priceFeedAddress);
        uint256 coinAmountInUsdCents = (coinPrice * coinAmount) /10000000000000000;
        return coinAmountInUsdCents;}
