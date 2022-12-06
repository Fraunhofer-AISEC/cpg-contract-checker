library PriceConverter {
     
    function getPrice(AggregatorV3Interface priceFeed)
        internal
        view
        returns (uint256)
    {
        (, int256 answer, , , ) = priceFeed.latestRoundData();
        
        return uint256(answer * 10000000000);
    }
}