function submitBid(uint _bid) public payable {
        require(block.timestamp < auctionEndTime, "Auction has ended");
        require(_bid > highestBid, "Bid must be higher than current highest bid");

        
        currentAddressBid[msg.sender] += _bid;
        
        highestBid = _bid;
        highestBidder = msg.sender;
        
        emit HighestBidIncrease(msg.sender,_bid);
}
