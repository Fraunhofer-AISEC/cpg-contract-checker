pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Tickets {

  struct Ticket {
    uint id;
    int val;
  }

  mapping(uint => Ticket) tickets;
  uint ticketCount;


  function addTicket(uint id, int val) public returns(bool success) {
    tickets[ticketCount] = Ticket({
        id: id,
        val: val
    });
    ticketCount += 1;

    success = true;
  }

  function getTicket(uint id) public view returns(Ticket memory) {
    for(uint i = 0; i<ticketCount; i++){
      if (tickets[i].id == id) {
        return tickets[i];
      }
    }
  }

  function findTickets(int val) public view returns(Ticket[] memory filteredTickets) {
    Ticket[] memory ticketsTemp = new Ticket[](ticketCount);
    uint count;
    for(uint i = 0; i<ticketCount; i++){
      if (tickets[i].val == val) {
        ticketsTemp[count] = tickets[i];
        count += 1;
      }
    }

    filteredTickets = new Ticket[](count);
    for(uint i = 0; i<count; i++){
      filteredTickets[i] = ticketsTemp[i];
    }

  }
}
