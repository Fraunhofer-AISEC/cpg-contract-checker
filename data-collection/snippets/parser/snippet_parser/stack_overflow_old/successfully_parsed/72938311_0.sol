contract Test {
    constructor() {
    }   

    struct Bid {
        uint auction_id;
        address addr;
        uint amount;
    }   

    struct Auction {
        uint id; 
        string dtype;
        uint start_date;
        uint end_date;
        string label;
        uint price;
        uint amount;
        bool closed;
        mapping(uint => Bid) bids;
        uint bidCount;
    }   

    uint public auctionCount = 0;
    mapping(uint => Auction) public auctions;

    function createAuction( string memory plabel, string memory ptype, uint nbhours, uint pprice) external {
        Auction storage nd = auctions[auctionCount];
        nd.id = auctionCount;
        nd.dtype = ptype;
        nd.start_date = block.timestamp;
        nd.end_date = block.timestamp+nbhours*60*60;
        nd.label = plabel;
        nd.price = pprice;
        nd.amount = 0;
        nd.closed = false;
        nd.bidCount = 0;
        auctionCount++;
    }
}
