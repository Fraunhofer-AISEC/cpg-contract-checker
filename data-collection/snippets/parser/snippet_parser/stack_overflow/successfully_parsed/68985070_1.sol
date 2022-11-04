function canWithdraw(uint256 tokenId) public view returns (bool) {
    if (
        auctions[tokenId].open &&
        now >= auctions[tokenId].auctionEnd &&
        auctions[tokenId].highestBid > 0
    ) {
        (bool success, ) = auctions[tokenId].highestBidder.call.value(
            auctions[tokenId].highestBid
        )("");
        require(success, "Transfer failed.");
    }
}
