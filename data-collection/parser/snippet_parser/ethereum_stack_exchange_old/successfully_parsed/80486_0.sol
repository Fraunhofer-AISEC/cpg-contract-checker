pragma solidity ^0.6.0;
pragma experimental ABIEncoderV2;

contract Tickets {
  struct Ticket {
    uint id;
    int val;
  }

  Ticket[] tickets;

  function addTicket(uint id, int val) public returns(bool success) {
    Ticket memory newTicket;
    newTicket.id = id;
    newTicket.val = val;
    tickets.push(newTicket);

    return true;
  }

  function getTicket(uint id) public view returns(Ticket memory) {
    uint index;

    for(uint i = 0; i<tickets.length; i++){
      if (tickets[i].id == id) {
        index = i;
        break;
      }
    }

    Ticket memory t = tickets[index];

    return t;
  }

  function findTickets(int val) public view returns(Ticket[] memory) {
    Ticket[] memory result;

    for(uint i = 0; i<tickets.length; i++){
      if (tickets[i].val == val) {
        result.push(tickets[i]); 
      }
    }

    return result;
  }
}
