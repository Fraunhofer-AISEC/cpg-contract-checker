function purchaseItemWithEth(uint _itemId) external payable nonReentrant {
        uint _totalPrice = getTotalPrice(_itemId);
        Item storage item = items[_itemId];
        require(_itemId > 0 && _itemId <= itemCount, "item doesn't exist");
        require(msg.value >= _totalPrice, "not enough ether to cover item price and market fee");
        require(!item.sold, "item already sold");
        
        item.seller.transfer(item.price);
        feeAccount.transfer(_totalPrice - item.price);
        
        item.sold = true;
        
        item.nft.transferFrom(address(this), msg.sender, item.tokenId);
        
        emit Bought(
            _itemId,
            address(item.nft),
            item.tokenId,
            item.price,
            item.priceOsaku,
            item.seller,
            msg.sender
        );
    } 
