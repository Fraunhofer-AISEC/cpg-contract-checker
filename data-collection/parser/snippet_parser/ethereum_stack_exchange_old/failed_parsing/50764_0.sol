function _bid(uint256 _tokenId, uint256 _bidAmount) internal returns (uint256) {

    Auction storage auction = _getAuctionByTokenId(_tokenId);
    require(_isOnAuction(auction));

    uint256 price = _currentPrice(auction);
    require(_bidAmount >= price);

    address seller = auction.seller;
    _removeAuction(_tokenId);

    
    if (price > 0) {
       ...
        uint256 auctioneerCut = _computeCut(price);
        uint256 sellerProceeds = price - auctioneerCut;
        
        seller.transfer(sellerProceeds);
    }

    emit AuctionSuccessful(_tokenId, price, msg.sender);
    return price;
}
