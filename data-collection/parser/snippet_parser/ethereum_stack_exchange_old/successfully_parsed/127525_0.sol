function createAuction(uint256 _bidIncrement, uint256 _timeInDays) public {
        uint256 currentBlock = block.number;
        Auction newAuction = new Auction(
            owner,
            currentBlock,
            currentBlock + endBlock(_timeInDays),
            _bidIncrement
        );
        auctions.push(address(newAuction));
    }
