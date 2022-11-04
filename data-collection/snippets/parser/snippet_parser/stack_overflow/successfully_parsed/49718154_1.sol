
contract CollectableAuction is ERC721TokenReceiver {
    mapping (uint256 => AuctionDetails) auctionDetails;

    struct AuctionDetails {
        ERC721 nftContract;
        bool bidIsComplete;
        address seller;
        address winningBidder;
        uint256 tokenId;
    }
}
