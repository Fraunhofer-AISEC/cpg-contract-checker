function bid(uint256 bidAmount) public payable {
        require(vault.tokenExists(address(nftAddress), nftId, owner) == true, "There are no units of this token available for sale!");
        require(msg.value == bidAmount, "Bid amount must be equal to sent value");
        require(block.timestamp < endTime, "Auction has already ended");
        require(bidAmount > winningBid, "Bid amount must be greater than the winning bid");

        
        if (winner != address(0)) {
            winner.transfer(winningBid);
            emit BidRefunded(winner, winningBid);
        }

        
        bids[msg.sender].push(Bid({bidder: payable(msg.sender), bidAmount: bidAmount}));
        winningBid = bidAmount;
        winner = payable(msg.sender);
        emit NewBid(msg.sender, bidAmount);
    }
