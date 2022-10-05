
pragma solidity ^0.8.15;

type TicketId is uint256;

contract Tickets {

  event TicketSold(TicketId id, address ticketOwner);

  address public owner = msg.sender;

  struct Ticket {
    TicketId id;
    uint256 price;
    address owner;
  }
  mapping(TicketId => Ticket) public tickets;

  modifier onlyOwner {
      require(owner == msg.sender);
      _;
  }

  
  function addTicket(TicketId id, uint256 price) public onlyOwner {
      tickets[id] = Ticket(id, price, address(0x0));
  }

  
  function removeTicket(TicketId id) public onlyOwner {
      delete tickets[id];
  }

  function buyTicket(TicketId id) external payable {
    require(tickets[id].owner == address(0x0), "Ticket already bought.");
    require(msg.value >= tickets[id].price, "Not enough balance to buy the ticket");
    tickets[id].owner = msg.sender;
    emit TicketSold(id, msg.sender);
  }
}
