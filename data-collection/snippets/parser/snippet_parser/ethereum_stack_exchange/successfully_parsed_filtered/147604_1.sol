function putItemToResell(address nftContract, uint256 itemId, uint256 newPrice)
        public
        payable
        nonReentrant
        onlyItemOwner(itemId)
    {
        uint256 tokenId = idToMarketItem[itemId].tokenId;
        require(newPrice > 0, "Price must be at least 1 wei");
        require(
            msg.value == listingPrice,
            "Price must be equal to listing price"
        );
        
        NFT tokenContract = NFT(nftContract);
        
        tokenContract.transferToken(msg.sender, address(this), tokenId);

        address payable oldOwner = idToMarketItem[itemId].owner;
        idToMarketItem[itemId].owner = payable(address(0));
        idToMarketItem[itemId].seller = oldOwner;
        idToMarketItem[itemId].price = newPrice;
        idToMarketItem[itemId].sold = false;
        _itemsSold.decrement();

        emit ProductListed(itemId);
    }

function fetchMarketItems() public view returns (MarketItem[] memory){
    uint itemCount = _itemIds.current();
    uint unsoldItemCount = _itemIds.current() - _itemsSold.current();
    uint currentIndex = 0;

    MarketItem[] memory items = new MarketItem[](unsoldItemCount);
    for (uint i = 0; i < itemCount; i++){
        if (idToMarketItem[i + 1].owner == address(0)){
            uint currentId = idToMarketItem [i+1].itemId;
            MarketItem storage currentItem = idToMarketItem[currentId];
            items[currentIndex] = currentItem;
            currentIndex +=1;
        }
    }
    return items;
}
