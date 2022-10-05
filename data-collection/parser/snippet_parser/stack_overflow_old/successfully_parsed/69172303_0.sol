     function fetchMarketItems() public view returns (MarketItem[] memory){
        uint itemCount = _tokenIds.current();
        uint unsoldItemCount = _tokenIds.current();
        uint currentIndex = 0;

        MarketItem[] memory items = new MarketItem[](unsoldItemCount);
        for(uint i=0; i < itemCount; i++){
            if(idToMarketItem[i + 1].owner == address(0)){
                uint currentId = idToMarketItem[i + 1].tokenId;
                MarketItem storage currentItem = idToMarketItem[currentId];
                items[currentIndex] = currentItem;
                currentIndex += 1;
            }
        }
        return items;
    }
