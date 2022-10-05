contract Price {
    address payable owner;
    AggregatorV3Interface internal priceFeed;
    uint current_price;
    ...
