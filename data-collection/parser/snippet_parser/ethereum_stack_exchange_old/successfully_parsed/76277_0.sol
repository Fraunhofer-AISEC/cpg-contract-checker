address payable public auctioneer;
address payable public lowestBidder;
uint public auctionEndTime;
uint public WTP;
uint public lowestBid;
bool ended;

mapping(address => uint) pendingReturns;

constructor(uint biddingTime) public payable {
    auctioneer = msg.sender;
    auctionEndTime = now + biddingTime;
    WTP = msg.value;
    lowestBid = WTP;
    ended = false;
}

function bid() public payable {                                         
    require(now <= auctionEndTime,"Auction already ended.");
    require(msg.value < WTP,"Bid exceeds willingness to pay.");
    require(msg.value < lowestBid,"There already is a lower bid.");
    if (lowestBid != 0) {
        lowestBidder.transfer(lowestBid);
        pendingReturns[lowestBidder] += lowestBid;
        lowestBidder = msg.sender;
        lowestBid = msg.value;
    }
}

function AuctionEnd() public {
    require(msg.sender == auctioneer,"Insufficient permission.");
    require(now >= auctionEndTime, "Auction not yet ended.");
    require(ended == false, "AuctionEnd has already been called.");
    lowestBidder.transfer(lowestBid*2); 
    auctioneer.transfer(address(this).balance);  
    ended = true;
}
