pragma solidity ^0.4.25;

contract BiddingContract
{
    
    struct Bid {
        address user;
        uint bidAmount;
    }

    
    
    Bid[] AllBids;

    
    constructor() public {
        AllBids.push(Bid(0x0, 0));
    }

    
    function submitBid(uint _bidPrice) public {
        
        uint lastIndex = AllBids.length - 1;
        
        require(_bidPrice > AllBids[lastIndex].bidAmount);
        
        AllBids.push(Bid(msg.sender, _bidPrice));
    }

    
    function getTopBid() public view returns (address, uint) {
        uint lastIndex = AllBids.length - 1;

        return (AllBids[lastIndex].user, AllBids[lastIndex].bidAmount);
    }

    
    
    function getNumberOfBids() public view returns (uint) {
        return AllBids.length;
    }

    
    
    function getBid(uint index) public view returns (address, uint) {
        return (AllBids[index].user, AllBids[index].bidAmount);
    }
}
