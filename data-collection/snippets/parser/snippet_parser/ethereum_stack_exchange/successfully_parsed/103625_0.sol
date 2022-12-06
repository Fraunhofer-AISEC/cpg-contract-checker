function buyItem(uint256 id) 
    ItemExists(id)
    IsForSale(id)
    HasTransferApproval(itemsForSale[id].tokenId)
    payable 
    external {
      require(msg.value >= itemsForSale[id].price, "Not enough funds sent");
      require(msg.sender != itemsForSale[id].seller);

      itemsForSale[id].isSold = true;
      activeItems[itemsForSale[id].tokenId] = false;
      token.safeTransferFrom(itemsForSale[id].seller, msg.sender, itemsForSale[id].tokenId);
      itemsForSale[id].seller.transfer(msg.value);
      

      emit itemSold(id, msg.sender, itemsForSale[id].price);
    }
