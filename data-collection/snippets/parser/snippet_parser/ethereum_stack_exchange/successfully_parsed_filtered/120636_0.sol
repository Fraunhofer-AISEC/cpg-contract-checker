 function fetchListings() external view returns (Listing[] memory) {
    uint itemCount = _itemIds.current();
    uint unsoldItemCount = _itemIds.current() - _itemsSold.current() - _itemsCancelled.current();
    uint currentIndex = 0;
    Listing[] memory items = new Listing[](unsoldItemCount);
    for (uint i = 0; i < itemCount; i++) {
      if (_listings[i + 1].owner == address(0)) {
        items[currentIndex] = _listings[i + 1];
        currentIndex += 1;
      }
    }
    return items;
  }
