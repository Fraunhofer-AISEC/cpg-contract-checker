  function getMarketTokens() public view returns (MarketToken[] memory) {
    uint256 itemCount = _tokenIds.current();
    uint256 unsoldItemCount = _tokenIds.current() - _tokensSold.current();
    uint256 currentIndex = 0;
    MarketToken[] memory items = new MarketToken[](unsoldItemCount);
    for (uint256 i = 0; i < itemCount; i++) {
      if (idToMarketToken[i + 1].owner == address(0)) {
        uint256 currentId = i + 1;
        MarketToken storage currentItem = idToMarketToken[currentId];
        items[currentIndex] = currentItem;
        currentIndex += 1;
      }
    }
    return items;
  }
