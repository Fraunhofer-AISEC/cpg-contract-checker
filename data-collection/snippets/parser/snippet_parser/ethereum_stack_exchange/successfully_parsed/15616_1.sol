pragma solidity ^0.4.0;

contract SimpleAuction {
    event HighestBidIncreased(address bidder, uint amount); 

    function bid() payable {
        
        HighestBidIncreased(msg.sender, msg.value); 
    }
}
