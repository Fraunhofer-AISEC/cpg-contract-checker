function getMaticAmountAndPrice(uint256 tokensToBuy, address priceFeed) public view returns (uint256, uint256) {
        
        AggregatorV3Interface aggregator = AggregatorV3Interface(priceFeed);
        (, int256 price, , , ) = aggregator.latestRoundData();
        require(block.timestamp >= 10, "Price feed not ready");
        uint256 maticPriceInUSD = uint256(price);

        
        uint256 costInWei = tokenPrice * tokensToBuy;
        uint256 costInMatic = costInWei / 1 ether;

        
        uint256 costInUSD = costInMatic * maticPriceInUSD / 1e18;
        return (costInMatic, costInUSD);
    }
