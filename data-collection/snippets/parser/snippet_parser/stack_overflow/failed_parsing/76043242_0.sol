pragma solidity ^0.8.0;

contract TicketBooking {
    
    struct Event {
        string name;
        string description;
        uint256 startDate;
        uint256 endDate;
        uint256 totalTickets;
        uint256 price;
        mapping (uint256 => bool) tickets;
    }
    Event[] events;
    mapping (uint256 => Event) events;
    address payable public admin;
    
    constructor() {
        admin = payable(msg.sender);
    }
    function getEvent(uint256 _id) public view returns (string memory, string memory, uint256, uint256, uint256, uint256, uint256) {
        Event memory event = events[_id];
        uint256 availableTickets = event.totalTickets;
        for (uint256 i = 0; i < event.totalTickets; i++) {
            if (event.tickets[i]) {
                availableTickets--;
            }
        }
        return (event.name, event.description, event.startDate, event.endDate, event.totalTickets, availableTickets, event.price);
    }

}

