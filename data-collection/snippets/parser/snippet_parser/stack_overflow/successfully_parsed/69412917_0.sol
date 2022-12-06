function claimAuction(uint auctionIndex) external {
    require(auctionIndex < auctions.length, "no auction");
    Auction memory auction = auctions[auctionIndex];
    require(block.timestamp <= auction.end, "auction still active");

    NFTCollectables ctr = NFTCollectables(nftCollectablesAddress);
    ctr.transfer(auction.highestBid.bidder, auction.nftId);

    
    for (uint i; i < activeAuctionIndexes.length; i++) {
      if (activeAuctionIndexes[i] == auctionIndex) {
        delete activeAuctionIndexes[i];
        break;
      }
    }

    emit AuctionEnd(auction.highestBid.bidder, auction.highestBid.price, auction.nftId);
}
