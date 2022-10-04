struct MarketItem {
        uint256 itemId;
        address nftContract;
        uint256 tokenId;
        address payable seller;
        address payable owner;
        uint256 price;
        bool sold;
    }
function getAll() public view returns (MarketItem[] memory) {
        uint256 myCount = 2;
        MarketItem[] memory items = new MarketItem[](myCount); 
        for (uint256 i = 0; i <= myCount; i++) {
            MarketItem storage currentItem = idMarketItem[i]; 
            items[i] = currentItem; 
        }
        return items;
    }
