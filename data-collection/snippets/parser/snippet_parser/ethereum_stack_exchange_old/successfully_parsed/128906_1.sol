pragma solidity ^0.8.0;

interface IERC721 { 
    function safeTransferFrom(address from, address to, uint tokenId) external;
    function transferFrom(address, address, uint) external;
}

contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint amount);
    event withdraw(address indexed bidder, uint amount);
    event end(address winner, uint amount); 
    
    IERC721 public nft;
    uint public nftId;

    address payable public seller;
    uint public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;

    constructor(address _nft, uint _nftId, uint _startingBid) payable {
        nft = IERC721(_nft);
        nftId = _nftId;
        
        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    function start() external {
        require(!started, "started");
        require(msg.sender == seller, "seller");

        nft.transferFrom(msg.sender, address(this), nftId);
        started = true;
        endAt = block.timestamp + 7 days;

        emit Start();
    }

    function bid() external payable {
        require(started, "not started");
        require(block.timestamp < endAt, "ended");
        require(msg.value > highestBid, "value < highest");

        highestBidder = msg.sender;
        highestBid = msg.value;
    }
}

contract see {

    
    function bidding(address _nft, uint _nftId, uint _startingBid) public payable {
        EnglishAuction englishauction = new EnglishAuction(_nft, _nftId, _startingBid);
        englishauction.bid();
    }
}
