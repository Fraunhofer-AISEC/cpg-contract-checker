function auctionItem(
        string calldata item_name,
        string calldata item_description,
        uint256 bidding_time,
        uint256 reveal_time
    ) external payable {
        uint256 auction_id = current_auction_id;
        current_auction_id += 1;
        activeauctions += 1;
        uint256 bidding_end = block.timestamp + bidding_time;
        uint256 reveal_end = bidding_end + reveal_time;

        Auctions[auction_id] = auctions(
            auction_id,
            msg.sender,
            bidding_end,
            reveal_end,
            false,
            item_name,
            item_description,
            false,
            address(0),
            0,
            new address payable[](0),
            address(0),
            0,
            ""
        );
        emit AuctionStarted(auction_id, item_name, item_description);
        emit BiddingStarted(auction_id, bidding_end);
    }
