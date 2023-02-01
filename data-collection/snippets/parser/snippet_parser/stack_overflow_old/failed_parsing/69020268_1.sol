uint public productIndex;
mapping (uint => address) productIdInStore;
mapping (address => mapping(uint => Product)) stores;

struct Product{
    uint id;
    string name;
    string category;
    string  imgLink;
    string descLink;
    uint auctionStartTime;
    uint auctionEndTime;
    uint startPrice;
    address highestBidder;
    uint highestBid;
    uint secondHighestBid;
    uint totalBids;
    ProductStatus status;
    ProductCondition condition;
    mapping (address => mapping(bytes32 => Bid)) bids;
}    

struct Bid{
    address bidder;
    uint productId;
    uint value;
    bool revealed;
}

constructor() public{
    productIndex = 0;
}

function addProductToStore(
    string calldata _name,
    string calldata _category,
    string calldata _imgLink,
    string calldata _descLink,
    uint _auctionStartTime,
    uint _auctionEndTime,
    uint _startPrice,
    uint _productCondition
) public{
        require(_auctionStartTime < _auctionEndTime);
        productIndex += 1;
        Product memory product = Product(
            productIndex,
            _name,
            _category,
            _imgLink,
            _descLink,
            _auctionStartTime,
            _auctionEndTime,
            _startPrice,
            address(0),
            0,
            0,
            0,
            ProductStatus.Open,
            ProductCondition(_productCondition),
        );
        stores[msg.sender][productIndex]=product;
        productIdInStore[productIndex] = msg.sender;
}
