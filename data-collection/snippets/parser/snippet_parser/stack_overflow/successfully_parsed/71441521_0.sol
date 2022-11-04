AggregatorV3Interface internal priceFeed;

constructor() {
    priceFeed = AggregatorV3Interface(0x5498BB86BC934c8D34FDA08E81D444153d0D06aD);
}

function getCurrentPrice() public view returns (int) {
    (
        ,
        int price,
        ,
        ,
        
    ) = priceFeed.latestRoundData();
    return price;
}

function convertCurrency(int amount) public view returns (int) {
    (
        ,
        int price,
        ,
        ,
        
    ) = priceFeed.latestRoundData();
    return amount * 10**16/price;
}
