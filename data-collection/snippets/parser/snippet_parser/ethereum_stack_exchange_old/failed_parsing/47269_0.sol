function purchaseItem(uint256 _itemID, uint256 _itemQuantity) public {
            require(itemData[_itemID].inStock);
            require(_itemQuantity > 0);

            uint256 priceOfItem = itemData[uint256(_itemID)].unitPrice.mul(_itemQuantity);

            token.approve(contract, priceOfItem);
            token.transferFrom(msg.sender, wallet, priceOfItem);
            itemData[uint256(_itemID)].itemQuantity = itemData[uint256(_itemID)].itemQuantity.sub(_itemQuantity);
            emit ItemPurchased(msg.sender, _itemID, _itemQuantity, (priceOfItem));
        }
