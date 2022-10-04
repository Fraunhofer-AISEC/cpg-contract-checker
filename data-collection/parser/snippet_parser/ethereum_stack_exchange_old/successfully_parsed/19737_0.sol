function bid() payable {
    
    
    
    
    

    
    
    require(now <= (auctionStart + biddingTime));

    
    
    require(msg.value > highestBid);

    if (highestBidder != 0) {
        
        
        
        
        
        pendingReturns[highestBidder] += highestBid;
    }
    highestBidder = msg.sender;
    highestBid = msg.value;
    HighestBidIncreased(msg.sender, msg.value);
}
