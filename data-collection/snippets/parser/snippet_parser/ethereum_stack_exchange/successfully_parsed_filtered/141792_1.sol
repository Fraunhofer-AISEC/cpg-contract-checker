

pragma solidity 0.8.3;  

contract EventContract {
    struct Event {
        address organiser;
        uint price;
        uint totalTickets;
        uint ticketsAvailable;
        uint startDate;
        uint endDate;
        address payable[] participants;
    }

    mapping(string=>Event) public allEvents;

    function newEvent(string memory name, uint price, uint totalTickets, uint startDate, uint endDate ) external {
        address payable[] memory  participants;
        allEvents[name]=Event({
            organiser:msg.sender,
            price:price,
            totalTickets:totalTickets,
            ticketsAvailable:totalTickets,
            startDate:startDate,
            endDate:endDate,
            participants:participants
        });
    }

    function alternativeWay(string memory name, Event calldata newEvent) external {
        allEvents[name]=newEvent;
    }

}
