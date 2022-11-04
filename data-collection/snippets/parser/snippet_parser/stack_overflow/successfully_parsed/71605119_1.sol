function getMarketItem(uint256 marketItemId) public view returns (MarketItem memory) {
  return idToMarketItem[marketItemId];
}

function fetchMarketItem(uint itemId) public view returns (MarketItem memory) {
  MarketItem memory item = idToMarketItem[itemId];
  return item;
}
