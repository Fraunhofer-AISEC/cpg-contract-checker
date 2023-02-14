    
    function onERC721Received(
        address,
        address from,
        uint256 tokenId,
        bytes calldata
    )
        external
        returns(bytes4)
    {
        uint256 auctionId = uint256(keccak256(abi.encode(uint256(msg.sender), tokenId)));
        auctionDetails[auctionId] = AuctionDetails({
            nftContract: ERC721(msg.sender),
            bidIsComplete: false,
            seller: from,
            winningBidder: address(0),
            tokenId: tokenId
        });
        return 0x150b7a02;
    }
