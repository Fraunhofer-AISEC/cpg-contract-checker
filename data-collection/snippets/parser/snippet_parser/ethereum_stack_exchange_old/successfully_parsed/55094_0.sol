pragma solidity ^0.4.22;

contract SimpleAuctions {
    uint  public beneficiary; 
    uint public auctionEnd; 
    address public highestBidder; 
    uint public highestBid; 
    mapping(address => uint) pendingReturns; 
    bool ended; 
    uint valueforbeneficiary;
    event HighestBidIncreased(address bidder, uint amount); 
    event AuctionEnded(address winner, uint amount); 
    function SimpleAuction(uint[] valueforgoods) public pure {
        uint allvalue;
        uint i;
        for (i = 0;i < valueforgoods.length;i++){
            allvalue = allvalue + valueforgoods[i];

             if (valueforgoods[i] > highestBid) {  
                highestBid = valueforgoods[i];
            }
        }
    }
    function bid() public payable {
        require(
            now <= auctionEnd,
            "Auction already ended."
        );
        require(
            msg.value > highestBid,
            "There already is a higher bid."
        );
        if (highestBid != 0) {
            pendingReturns[highestBidder] += highestBid;
        }
        highestBidder = msg.sender;
        highestBid = msg.value;
        
        emit HighestBidIncreased(msg.sender, msg.value);
    }

    function auctionEnd() public {
        require(now >= auctionEnd, "Auction not yet ended.");
        require(!ended, "auctionEnd has already been called.");
        ended = true;
        emit AuctionEnded(highestBidder, highestBid);
        beneficiary.transfer(highestBid);
    }
}
