pragma solidity ^0.4.25;

contract bidding {

    address[] public bidderAccts;

    
    mapping (address => uint[]) public bids;

    event LogNewBidder(address newBidder);
    event LogNewBid(address bidder, uint bid);

    function isBidder(address bidder) public view returns(bool isIndeed) {
        
        return bids[bidder].length > 0;
    }

    function upsertBidder(address bidder) public {
        if(!isBidder(bidder)) {
            bidderAccts.push(bidder);
            emit LogNewBidder(bidder);
        }
    }

    function setBid(uint bid)  public {
            
            require(bid > 0);
            upsertBidder(msg.sender);
            bids[msg.sender].push(bid);
            emit LogNewBid(msg.sender, bid);
    }

     function getUniqueBidderCount() view public returns (uint) {
        return bidderAccts.length;
    }       

}
