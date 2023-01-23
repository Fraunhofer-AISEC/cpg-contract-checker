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

    function newEvent(string memory name, uint price, uint totalTickets, uint startDate, uint endDate) external {
        allEvents[name]=Event({
            organiser:msg.sender,
            price:price,
            totalTickets:totalTickets,
            ticketsAvailable:totalTickets,
            startDate:startDate,
            endDate:endDate
        });
    }
}
