IERC20 tokenAddress;

IERC20 token = IERC20(tokenAddress);


address payable public  beneficiary;
uint auctionEndTime;


address public highestBidder;
uint public highestBid;

mapping(address => uint) public currentAddressBid;

bool ended = false;

event HighestBidIncrease(address bidder, uint bid);
event AuctionEnded(address winner, uint amount);

constructor(
    uint _biddingTime,
    address payable _beneficiary,
    IERC20 _tokenAddress
    ) 
    
    { 
        beneficiary = _beneficiary;
        auctionEndTime = block.timestamp + _biddingTime;
        tokenAddress = _tokenAddress;
        
    }

function returnHighestBid() public view returns(uint) {
    return highestBid;
}


function submitBid(uint _bid) public {
    require(block.timestamp < auctionEndTime, "Auction had ended");
    require(_bid > highestBid, "Bid must be higher than current highest bid");

    token.transfer(address(this), _bid); 


    
    currentAddressBid[msg.sender] += _bid;
    
    highestBid = _bid;
    highestBidder = msg.sender;
    
    emit HighestBidIncrease(msg.sender,_bid);

    

}
