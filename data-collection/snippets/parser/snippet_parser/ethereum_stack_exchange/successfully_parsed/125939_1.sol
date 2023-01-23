contract Auction is IAuction {
    uint256 private startTime; 
    address private maxBidder; 
    bool private isCancelled; 
    bool private isDirectBuy; 
    uint256 private minIncrement; 
    address private nftAddress;

    IERC721 private nft; 

    Bid[] private bids; 

    uint256 public endTime; 
    uint256 public maxBid; 
    address public creator; 
    uint256 public tokenId; 
    uint256 public directBuyPrice; 
    uint256 public startPrice; 

    constructor(
        address _creator,
        uint256 _endTime,
        uint256 _minIncrement,
        uint256 _directBuyPrice,
        uint256 _startPrice,
        address _nftAddress,
        uint256 _tokenId
    ) {

        creator = _creator;
        startTime = block.timestamp;
        endTime = startTime + _endTime;
        minIncrement = _minIncrement;
        directBuyPrice = _directBuyPrice;
        startPrice = _startPrice;
        nft = IERC721(_nftAddress);
        nftAddress = _nftAddress;
        tokenId = _tokenId;
        maxBidder = _creator;
    }

    
    function placeBid() external payable override returns (bool) {
        require(
            msg.sender != creator,
            "Auction: the bidder cannot be the auction creator"
        );
        require(
            getAuctionState() == AuctionState.OPEN,
            "Auction: the auction must be open"
        );
        require(
            msg.value >= startPrice,
            "Auction: the bid must be greater than the start price"
        );
        require(
            msg.value > maxBid + minIncrement,
            "Aucton: the bid must be greater than the highest bid + minimum bid increment"
        );

        address lastHightestBidder = maxBidder;
        uint256 lastHighestBid = maxBid;
        maxBid = msg.value;
        maxBidder = msg.sender;

        if (msg.value >= directBuyPrice) {
            isDirectBuy = true;
        }

        bids.push(Bid(msg.sender, msg.value));

        if (lastHighestBid != 0) {
            (bool success, ) = payable(lastHightestBidder).call{
                value: lastHighestBid
            }("");
            require(success, "Failed to transfer Ether");
        }

        emit NewBid(msg.sender, msg.value);

        return true;
    }
}
