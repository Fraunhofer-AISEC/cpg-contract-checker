function fetchMarketTokens( ) view public returns (MarketToken[] memory) {
     uint itemCount = _tokenIds.current();
     uint unSoldItemCount = _tokenIds.current() - _tokenSold.current();
     uint currentIndex = 0;

    
    MarketToken[] memory items = new MarketToken[](unSoldItemCount);

    for (uint256 i = 0; i < itemCount; i++) {
        if (idToMarketToken[i+1].owner == address(0)) {
            uint currentId = i + 1;
            MarketToken storage currentItem = idToMarketToken[currentId];
            items[currentIndex] = currentItem;
            ++currentIndex;
        }
    }
    return items;
}
