pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Tickets {
  struct Ticket {
    uint serie;
    uint number;
    uint datetime;
  }

  Ticket[] tickets;

  function addTicket(Ticket memory newTicket) public returns(bool success) {
    tickets.push(newTicket);
    return true;
  }

  function getTickets() public view returns(Ticket[] memory) {
    return tickets;
  }
}
