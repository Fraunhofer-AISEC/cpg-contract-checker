function purchaseItemWithToken(uint _itemId) external payable nonReentrant {
        uint _totalPrice = getTotalPriceWithToken(_itemId;
        Item storage item = items[_itemId];
        require(_itemId > 0 && _itemId <= itemCount, "item doesn't exist");
        
        require(!item.sold, "item already sold");
        
        depositTokens(10);
        sendTokens(item.seller, item.pricewithToken);
        sendTokens(feeAccount, (_totalPrice - item.pricewithToken));
        
        item.sold = true;
        
        item.nft.transferFrom(address(this), msg.sender, item.tokenId);
        
        emit Bought(
            _itemId,
            address(item.nft),
            item.tokenId,
            item.price,
            item.priceToken,
            item.seller,
            msg.sender
        );
    }

    function getTotalPrice(uint _itemId) view public returns(uint){
        return((items[_itemId].price*(100 + feePercent))/100);
    }

    function getTotalPriceToken(uint _itemId) view public returns(uint) {
        return((items[_itemId].priceToken*(100 + feePercent))/100);
    }

    function depositTokens(uint _amount) public {
        ERC20(_token).transferFrom(msg.sender, address(this), _amount);
    }

    function sendTokens(address _to, uint _amount) public {
        ERC20(_token).transfer(_to, _amount);
    }

    function getTokenSmartContractBalance() external view returns(uint) {
        return ERC20(_token).balanceOf(address(this));
    }
