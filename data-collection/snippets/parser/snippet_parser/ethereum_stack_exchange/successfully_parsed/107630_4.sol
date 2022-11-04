
IERC20 token = IERC20(yourTokenAddress);




function submitBid(uint _bid) public { 
    require(block.timestamp < auctionEndTime, "Auction has ended"); 
    require(_bid > highestBid, "Bid must be higher than current highest bid");
    token.transferFrom(msg.sender, address(this), _bid); 
    currentAddressBid[msg.sender] += _bid;
    
    highestBid = _bid;
    highestBidder = msg.sender;
    
    emit HighestBidIncrease(msg.sender,_bid);

}
