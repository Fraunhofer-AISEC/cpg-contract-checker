function bid (uint256 _tokenId, uint256 _amount) public returns (bool) {
    Auction currentAuction = auctions[_tokenId];
    
    uint256 newBidIndex = currentAuction.bids.length + 1;
    Bid newBid = currentAuction.Bids[newBidIndex];
    newBid.bidder = msg.sender;
    newBid.amount = msg.amount;
    newBid.timestamp = block.timestamp;

    currentAuction.winningBidAmount = msg.value;
    currentAuction.winningBidBidder = msg.sender;
    
    return true;
  }
