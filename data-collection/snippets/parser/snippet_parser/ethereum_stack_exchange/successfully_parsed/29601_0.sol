pragma solidity ^0.4.11;

import '../contracts/Auction.sol';

contract AuctionFactory {


mapping( address => address) public auctions;

function createAuction(uint32 pTicketPerPerson, uint256 pTotalTickets, uint256 pEndTime, uint32 pMinimumBid) returns (address auctionAddress) {

    address owner = msg.sender;
    Auction newAuction = new Auction(owner, pTicketPerPerson, pTotalTickets, pEndTime, pMinimumBid);
    auctions[owner] = newAuction;
    return newAuction;

}


function getAuctionAddress( address auctioneer) returns (address auctionAddress) {

    
    return auctions[auctioneer];
}
}
