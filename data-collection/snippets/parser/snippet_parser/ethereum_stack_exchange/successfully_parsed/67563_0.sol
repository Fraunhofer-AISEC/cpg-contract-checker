 function bid() public payable an_ongoing_auction returns (bool){
    uint oldval = bids[msg.sender];
    require(msg.value+oldval > highestBid,"You can't bid, Make a higher Bid");
    highestBidder = msg.sender;
    highestBid = msg.value+oldval;
    if(oldval==0)
        bidders.push(msg.sender);
    bids[msg.sender] +=msg.value;
    emit BidEvent(highestBidder,  highestBid);
    return true;
}
