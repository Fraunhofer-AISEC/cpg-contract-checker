function AuctionNft(string memory _name) public payable {
    MyNft storage nft = fetchNft[_name];
    
    require(nft.isAuctionable, "This nft is not listed for auction yet");
    require(block.timestamp <= timer,"Auction for this NFt has been ended");
    require(msg.value >= minBid, "Minimum Bid is not met");
    
    address currentBidder = msg.sender;
    bidders storage prevbidder = previousBidder[currentBidder];
    prevbidder.Address = msg.sender;
    prevbidder.bidAmount = 0;
    
    address payable recipient = payable(nft.owner);
    require(msg.value > currentBid, "Bid is lower than the previous bid");
    currentBid = msg.value * 1 ether;
    if (block.timestamp > timer) {
        recipient.transfer(currentBid);
        nft.owner = currentBidder;
        nft.isOnSale = false;
        nft.isAuctionable = false;
    }
}
