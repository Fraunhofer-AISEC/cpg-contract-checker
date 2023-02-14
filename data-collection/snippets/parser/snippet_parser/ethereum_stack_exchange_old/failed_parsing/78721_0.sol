pragma solidity ^0.4.22;

contract SimpleAuction {
address public beneficiary1;
address public beneficiary2;
uint public auctionEnd;





address public highestBidder1;
uint public highestBid1;

address public highestBidder2;
uint public highestBid2;

uint public proportion;
uint public bid1;
uint public bid2;

mapping(address => uint) pendingReturns;

bool ended;

constructor (uint _biddingTime) public {
    beneficiary1 = msg.sender;
    beneficiary2 = msg.sender;
    auctionEnd = now + _biddingTime;
}


function () public payable{
    makebid(proportion);
}


function makebid(uint var1) public payable {

    
    proportion = var1;
    
    bid1 = var1 * msg.value;
    bid2 = 1 - var1 * msg.value;

    require(now <= auctionEnd);

    
    
    

    
      
    
    
    



    require(bid1 > highestBid1);

    if (highestBid1 != 0) {

        pendingReturns[highestBidder1] += highestBid1;
    }
    highestBidder1 = msg.sender;
    highestBid1 = bid1;


    require(bid2 > highestBid2);

    if (highestBid2 != 0) {

        pendingReturns[highestBidder2] += highestBid2;
    }
    highestBidder2 = msg.sender;
    highestBid2 = bid2;

}

function withdraw() public returns (bool) {
    uint amount1 = pendingReturns[highestBidder1];
    if (amount1 > 0) {
        pendingReturns[highestBidder1] = 0;

        if (!msg.sender.send(amount1)) {
            pendingReturns[highestBidder1] = amount1;
            return false;
        }

    uint amount2 = pendingReturns[highestBidder2];
    if (amount2 > 0) {

        pendingReturns[highestBidder2] = 0;

        if (!msg.sender.send(amount2)) {
            
            pendingReturns[highestBidder2] = amount2;
            return false;
        }

    }
    return true;
  }

}

    
   require(now >= auctionEnd); 
    require(!ended); 

    
    ended = true;

    
    beneficiary1.transfer(highestBid1);
    beneficiary2.transfer(highestBid2);

}


}
