
     function createMarketItem(
            address nftContract,
            uint256 tokenId,
            uint256 price
          ) public payable nonReentrant {
            require(price > 0, "Price must be at least 1 wei");
            require(msg.value == listingPrice, "Price must be equal to listing price");
        
        
            _itemIds.increment();
            uint256 itemId = _itemIds.current();
        
            idToMarketItem[itemId] = MarketItem(
              itemId,
              nftContract,
              tokenId,
              payable(msg.sender),
              payable(address(0)),
              price,
              false
            );
        
            IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);
        
            emit MarketItemCreated(
              itemId,
              nftContract,
              tokenId,
              msg.sender,
              address(0),
              price,
              false
            );
          }
        
          
          
          function createMarketSale(
            address nftContract,
            uint256 itemId
        
            ) public payable nonReentrant {
        
            uint price = idToMarketItem[itemId].price;
            uint tokenId = idToMarketItem[itemId].tokenId;
            require(msg.value == price, "Please submit the asking price in order to complete the purchase");
            idToMarketItem[itemId].seller.transfer(msg.value);
            IERC721(nftContract).transferFrom(address(this), msg.sender, tokenId);
            idToMarketItem[itemId].owner = payable(msg.sender);
            idToMarketItem[itemId].sold = true;
            _itemsSold.increment();
            payable(owner).transfer(listingPrice);
      

}
