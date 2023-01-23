function createBidOnItem(
    uint256 itemId
    ) public payable nonReentrant {
     uint price = idToMarketItem[itemId].price;
    uint tokenId = idToMarketItem[itemId].tokenId;
    require(IERC721(nftContractAddress).isApprovedForAll(idToMarketItem[itemId].seller,address(this)) ||
      IERC721(nftContractAddress).getApproved(tokenId)==address(this)
    ,"Current Item is not approved");
    require(idToMarketItem[itemId].isOnAuction,"Item is not on auction");
    require(idToMarketItem[itemId].bidEndTime>block.timestamp,"Auction time ended");
    require(!idToMarketItem[itemId].sold,"Already sold");
    require(msg.sender!=idToMarketItem[itemId].seller,"Already owned");
    require(msg.value >= price && msg.value > highestBidderMapping[itemId].amount, "Bid price must be greater than base price and highest bid");

    if(highestBidderMapping[itemId].bidderAddr!=address(0)){
      amountToPayMapping[highestBidderMapping[itemId].bidderAddr] = amountToPayMapping[highestBidderMapping[itemId].bidderAddr].add(highestBidderMapping[itemId].amount);
    }
    totalAmountDue = totalAmountDue.add(msg.value);
    highestBidderMapping[itemId] = Bidder({
      amount:msg.value,
      bidderAddr:msg.sender
    });
  }
