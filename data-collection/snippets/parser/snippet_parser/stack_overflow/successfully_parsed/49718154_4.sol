    function withdraw(uint256 auctionId) external {
        AuctionDetails storage details = auctionDetails[auctionId];

        require(details.bidIsComplete);
        require(msg.sender == details.winningBidder);
        

        details.nftContract.safeTransferFrom(address(this), details.winningBidder, details.tokenId);
        
        
        delete auctionDetails[auctionId];
    }
