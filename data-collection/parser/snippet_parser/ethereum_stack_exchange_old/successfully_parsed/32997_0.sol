function startAuction(string name, uint timeLimit) public returns (uint[]) {
    uint auctionID = totalAuctions++;
    AuctionStruct a = Auctions[auctionID];
    a.recipient = msg.sender; 
    a.name = name;
    uint array = auctionList.length; 
    auctionList.push(13);
    Update(a.name, a.highestBid, a.highestBidder, a.recipient, auctionID, array);   
    return auctionList;    
}
