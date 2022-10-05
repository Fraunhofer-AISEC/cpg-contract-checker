contract Auction {

    struct Bidder {
        address addr;
        uint256 amount;
    }

    uint256 puiblic currentBid;

    mapping(string => Bidder) public nftHighestBidders;

    uint256 private constant minBid = 0.1 ether;
    
    uint256 private constant timer = block.timestamp + 5 days;


    function AuctionNft(string memory _name) public payable {
        MyNft storage nft = fetchNft[_name];

        require(nft.isAuctionable, "This nft is not listed for auction yet");
        require(block.timestamp <= timer,"Auction for this NFt has been ended");
        require(msg.value >= minBid, "Minimum Bid is not met");
        require(msg.value > currentBid, "Bid is lower than the previous bid");

        address currentBidder = msg.sender;
        Bidder storage highestBidder = nftHighestBidders[_name];
        
        address payable recipient = payable(nft.owner);

        recipient.transfer(msg.value);
        nft.owner = currentBidder;

        currentBid = msg.value;

        highestBidder.addr = msg.sender;
        highestBidder.amount = msg.value;
    }
}
