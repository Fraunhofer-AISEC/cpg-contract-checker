
    
    
    
    function bid() external payable {
        
        
        
        
        

        
        
        if (block.timestamp > auctionEndTime)
            revert AuctionAlreadyEnded();

        
        
        
        
        
        if (msg.value <= highestBid)
            revert BidNotHighEnough(highestBid);

        if (highestBid != 0) {
            
            
            
            
            
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        emit HighestBidIncreased(msg.sender, msg.value);
    }
