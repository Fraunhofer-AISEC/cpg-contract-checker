
function getThePriceAndTimestamp() public view returns (int, uint) {
    (
        uint80 roundID, 
        int price,
        uint startedAt,
        uint timeStamp,
        uint80 answeredInRound
    ) = priceFeed.latestRoundData();
    return (price, timeStamp); 
}
