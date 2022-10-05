pragma solidity ^0.4.11;

  contract Auction {

    uint32 ticketId = 0;
    uint32 public balanceTikets;
    uint32 public ticketPerPerson;
    uint32 public minimumBid;
    uint32 public highestBid;
    uint256 public totalTickets;
    uint256 public endTime;
    uint256 public lastBid;

    address public lastBidder;
    address public auctioneer;

    mapping( address => Ticket[]) public allotedTicketsCount;

    mapping( address => uint256) public bids;

    event BidCreated(address bidder, uint32 bidAmount);
    event HighestBid(address bidder, uint32 bidAmount);

    struct Ticket {
       uint32 id;
       uint32 pricePaid;
    }


    
    function Auction(address owner, uint32 pTicketPerPerson, uint256 pTotalTickets, uint256 pEndTime, uint32 pMinimumBid ) {
      auctioneer = owner;
      ticketPerPerson = pTicketPerPerson;
      totalTickets = pTotalTickets;
      endTime = now + (pEndTime * 1 hours );
      minimumBid = pMinimumBid;
      highestBid = pMinimumBid; 
    }


    function bidForTicket(address bidder, uint256 amount)  {

     bids[bidder] = amount;
     lastBidder = bidder;
     lastBid = amount;

   }

   function getBidFor(address bidAddress) returns (uint256 bidAmt) {
      return bids[bidAddress];
   }

  }
