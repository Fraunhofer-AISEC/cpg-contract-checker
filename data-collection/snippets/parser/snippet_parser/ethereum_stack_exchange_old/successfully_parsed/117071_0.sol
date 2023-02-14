function getETHPrice() internal view returns (int) {
    (,int price,,,) = AggregatorV3Interface(ETH_USD_FEED).latestRoundData();
    return price;
}
