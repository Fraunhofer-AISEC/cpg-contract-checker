function marketItemResell(
        address nftContract,
        uint256 itemId,
        uint256 price
    ) public payable nonReentrant {
        
        
        
        
        require(price > 0, "Price must be at least 1 wei");
        require(
            msg.value == listingPrice,
            "Price must be equal to listing price"
        );

        uint256 tokenId = idToMarketItem[itemId].tokenId;

        IERC721(nftContract).transferFrom(msg.sender, address(this), tokenId);

        idToMarketItem[itemId].seller = payable(msg.sender);
        idToMarketItem[itemId].owner = payable(address(0));
        idToMarketItem[itemId].price = price;
        idToMarketItem[itemId].sold = false;

        _itemsSold.decrement();

        emit ItemListed(
            itemId,
            nftContract,
            tokenId,
            msg.sender,
            address(0),
            price,
            false
        );
    }
