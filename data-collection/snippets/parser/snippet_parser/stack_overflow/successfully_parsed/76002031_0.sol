function getLatestDaiPrice(address daiAggregator) external view returns (int) {
  require(daiAggregator != address(0), "Invalid address"); 
  return priceConsumer.getLatestPrice(daiAggregator);
}
