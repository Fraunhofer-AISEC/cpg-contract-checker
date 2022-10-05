contract AuctionHouse {
  struct Bid {
    address bidder;
    uint256 amount;
    uint256 timestamp;
  }
  
  struct Auction {
    address seller;
    uint256 reservePrice;
    uint256 winnerBidAmount;
    address winnerBidBidder;
    
    Bid[] Bids;
  }
  
  function listItem (uint256 _tokenId) public returns (bool) {
    Bid[] memory emptyBids;

    auctions[_tokenId] = Auction({
      seller: msg.sender,
      reservePrice: _reservePrice,
      winningBidAmount: 0,
      winningBidBidder: address(0),
      bids: emptyBids
    });

    return true;
  }
  
  function bid (uint256 _tokenId, uint256 _amount) public returns (bool) {
    Auction currentAuction = auctions[_tokenId];
    
    uint256 newBidIndex = currentAuction.bids.length + 1;
    Bid newBid = currentAuction[newBidIndex];
    newBid.bidder = msg.sender;
    newBid.amount = msg.amount;
    newBid.timestamp = block.timestamp;

    currentAuction.winningBidAmount = msg.value;
    currentAuction.winningBidBidder = msg.sender;
    
    return true;
  }
}
