contract SmartAuction {
    address payable public beneficiary;
    uint public auctionEnd;

    address public highestBidder;
    uint public highestBid;

    mapping(address => uint) private pendingReturns;

    bool private ended;
...
}
