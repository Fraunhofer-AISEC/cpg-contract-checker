pragma solidity ^0.4.22;

contract SimpleAuction {

    address public beneficiary;
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
        beneficiary = msg.sender;
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

    }

        require(bid2 > highestBid2);

        if (highestBid2 != 0) {
            pendingReturns[highestBidder2] += highestBid2;
        }
        highestBidder2 = msg.sender;
        highestBid2 = bid2;

    }

}
