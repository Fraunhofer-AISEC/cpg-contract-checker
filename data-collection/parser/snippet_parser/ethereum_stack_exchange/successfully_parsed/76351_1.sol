pragma solidity ^0.4.0;

contract SimpleAuction {
   uint public auctionStart;
   uint public biddingTime;
   function SimpleAuction(
   ) {
       auctionStart = now;
   }
}
