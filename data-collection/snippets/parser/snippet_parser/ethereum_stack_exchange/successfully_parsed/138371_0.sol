    function checkUpkeep(bytes calldata ) external view override returns(bool upkeepNeeded, bytes memory performData) {
        for(uint i=0; i < auctionIDs.length; i++){
            if(auctions[auctionIDs[i]].endTime != 0 && block.timestamp > auctions[auctionIDs[i]].endTime){
                upkeepNeeded = true;
                performData = abi.encodePacked(uint256(auctionIDs[i]));
            }
        }
        return (upkeepNeeded, performData);
    }

    function performUpkeep(bytes calldata performData) external override nonReentrant {
        uint256 auction_id = abi.decode(performData, (uint256));

        if(auctions[auction_id].endTime != 0 && block.timestamp > auctions[auction_id].endTime){

            auctions[auction_id].listed = false;

            safeTransferFrom(podcastId[auctions[auction_id].podcastId].nftOwner, bidders[auction_id].highestBidder, podcastId[auctions[auction_id].podcastId].tokenId);

            uint256 platformCut = (platformFee * bidders[auction_id].highestBid)/100;
            uint256 NftOwnerCut = bidders[auction_id].highestBid - platformCut;

            (bool pass, ) = platformFeeRecipient.call{value: platformCut}("");
            require(pass, "platformFee Transfer failed");
            (bool success, ) = (podcastId[auctions[auction_id].podcastId].nftOwner).call{value: NftOwnerCut}("");
            require(success, "NftOwnerCut Transfer Failed");

            podcastId[auctions[auction_id].podcastId].nftOwner = bidders[auction_id].highestBidder;
            emit AuctionResulted(auction_id, bidders[auction_id].highestBidder, bidders[auction_id].highestBid);
            bidders[auction_id].highestBid = 0;
            auctions[auction_id].endTime = 0;
            
        }

    }
