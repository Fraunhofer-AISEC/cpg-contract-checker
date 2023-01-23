function createAuction(
        ERC1155 _nftAddress,
        uint256 _tokenId,
        address _seller,
        uint128 _startPrice,
        uint256 _duration,
        uint128 _highestBid,
        address _highestBidder
    )public payable
    {
        require(_ownerOf(address(_nftAddress),_tokenId));
        _escrow(msg.sender,address(_nftAddress), _tokenId);
        Auction memory auction = Auction(
            ERC1155(_nftAddress),
            uint256(_tokenId),
            payable(_seller),
            uint128(_startPrice),
            uint64(_duration),
            uint128(_highestBid),
            payable(_highestBidder)
        );
