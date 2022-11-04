    function createMarketSale(
    address nftContract,
    uint256 itemId,
    uint256 amount,
    bytes memory data
    ) public payable nonReentrant {
        uint price = idToMarketItem[itemId].price;
        uint tokenId = idToMarketItem[itemId].tokenId;
        bool sold = idToMarketItem[itemId].sold;
        require(msg.value == price, "Please submit the asking price in order to complete the purchase");
        require(sold != true, "This Sale has alredy finnished");
        emit MarketItemSold(
            itemId,
            msg.sender
            );

        idToMarketItem[itemId].seller.transfer(msg.value);
        IERC1155(nftContract).safeTransferFrom(msg.sender, address(this), tokenId, amount, data);
        idToMarketItem[itemId].owner = payable(msg.sender);
        _itemsSold.increment();
        idToMarketItem[itemId].sold = true;
    }
