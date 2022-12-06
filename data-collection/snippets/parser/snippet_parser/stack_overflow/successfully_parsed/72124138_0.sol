function fetchUnsoldMarketItems(uint256[] memory _tokenIds) public view returns (MarketItem[] memory) {
      uint arrayLen = _tokenIds.length;
      uint itemsCount = 0;          

      for (uint i = 0; i < arrayLen; i++) {
      if (idToMarketItem[_tokenIds[i]].sold == false) {
          itemsCount +=1;
        }        
      }

      MarketItem[] memory items = new MarketItem[](itemsCount);

      for (uint i = 0; i < arrayLen; i++) {
      if (idToMarketItem[_tokenIds[i]].sold == false) {
          MarketItem storage currentItem = idToMarketItem[_tokenIds[i]];
          items[i] = currentItem;
        }        
      }

      return items;
    }
