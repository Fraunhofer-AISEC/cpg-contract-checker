if (msg.value > winningBid) {
            pendingReturns[msg.sender] += msg.value;
            auctionWinner = msg.sender;
            winningBid = msg.value;
            emit RegularBidding(msg.sender, msg.value);
}
