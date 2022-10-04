contract AuctionFactory is IAuctionFactory {
    using Counters for Counters.Counter;
    Counters.Counter private auctionIds;
    uint256 private minAuctionDuration = 5 minutes;

    mapping(uint256 => Auction) public auctions;

    
    function createAuction(
        uint256 _endTime,
        uint256 _minIncrement,
        uint256 _directBuyPrice,
        uint256 _startPrice,
        address _nftAddress,
        uint256 _tokenId
    ) external override returns (bool) {
        require(
            msg.sender != address(0),
            "Auction: Creator of the auction can't be zero address"
        );
        require(
            _endTime > block.timestamp,
            "Auction: finish time of auction cannot be less than current time"
        );
        require(
            _endTime >= minAuctionDuration,
            "Auction: end time must be greater than 5 minutes"
        );
        require(
            _minIncrement > 0,
            "Auction: min increment for bid annot be less than 0"
        );
        require(
            _directBuyPrice > 0,
            "Auction: buy price cannot be less than 0"
        );
        require(
            _startPrice < _directBuyPrice,
            "Auction: start price is smaller than direct buy price"
        );
        require(
            _nftAddress != address(0),
            "Auction: NFT address can't be zero address"
        );
        require(_tokenId > 0, "Auction: token id cannot be less than 0");

        uint256 auctionId = auctionIds.current();
        auctionIds.increment();
        Auction auction = new Auction(
            msg.sender,
            _endTime,
            _minIncrement,
            _directBuyPrice,
            _startPrice,
            _nftAddress,
            _tokenId
        );

        IERC721 nftToken = IERC721(_nftAddress);
        nftToken.transferFrom(msg.sender, address(auction), _tokenId);
        auctions[auctionId] = auction;

        emit CreatedAuction(
            msg.sender,
            block.timestamp,
            _endTime,
            _minIncrement,
            _directBuyPrice,
            _startPrice,
            _nftAddress,
            _tokenId
        );

        return true;
    }
}
