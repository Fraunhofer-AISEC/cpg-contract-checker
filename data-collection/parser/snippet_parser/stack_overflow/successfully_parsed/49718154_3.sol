    function completeAuction(uint256 auctionId) external {
        auctionDetails[auctionId].bidIsComplete = true;
    }
