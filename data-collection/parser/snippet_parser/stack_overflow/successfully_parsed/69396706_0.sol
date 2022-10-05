function bid() public payable {
    require(
        now <= auctionEndTime,
        "Auction already ended."
    );

    require(
        
        msg.value > highestBid,
        "There already is a higher bid."
    );

    if (highestBid != 0) {
        pendingReturns[highestBidder] += highestBid;
    }
    highestBidder = msg.sender;
    highestBid = msg.value;
    emit HighestBidIncreased(msg.sender, msg.value);
}
