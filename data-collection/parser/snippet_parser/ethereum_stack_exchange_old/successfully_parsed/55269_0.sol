function withdraw(uint256 _auctionId) public {
    AuctionData storage auction = auctions[_auctionId];
    require(!auction.isOpen);

    uint256 payout;

    if(msg.sender == auction.owner) {
        payout = auction.maxBid;
        auction.maxBid = 0;
    }

    
    
    
    
    if(msg.sender != auction.maxBidder && msg.sender != auction.owner) {
        payout = auction.bids[msg.sender];
        auction.bids[msg.sender] = 0;
    }

    if(msg.sender == auction.maxBidder) {
        
        
        delete auction.maxBidder;
    }

    msg.sender.transfer(payout);

    emit Withdraw(msg.sender, payout);
}
