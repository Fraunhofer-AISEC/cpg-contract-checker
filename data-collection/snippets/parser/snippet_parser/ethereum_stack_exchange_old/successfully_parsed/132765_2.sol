AggregatorV3Interface _priceFeed; 

function bar() public payable {
    uint amount = PriceConverter.getConversionRate(msg.value, _priceFeed);
    require(amount >= MINIMUM_USD, "Insufficient amount");
}
