pragma solidity ^0.4.17;

contract EventFactory {
    address[] public deployedEvents;

    function createEvent(string title, uint max, uint cost, string description, string location, uint date) public {
        address newEvent = new Event(title, msg.sender, max, cost, description, location, date);
        deployedEvents.push(newEvent);
    }

    function getDeployedEvents() public view returns (address[]) {
        return deployedEvents;
    }
}

contract Event {
    struct Attendee {
        bool valid;
        string name;
        uint ticketNumber;
        bool confirmed;
        uint amountPaid;
        uint confirmationCode;
    }

    address public manager;
    string public title;
    uint public maxAttendees;
    uint public ticketsSold;
    mapping(address=>Attendee) public attendees;
    uint public ticketCost;
    string public eventDescription;
    string public eventLocation;
    uint public eventDate;
    mapping(address=>bool) public blacklist;


    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function random(uint seed) private view returns (uint) {
        uint tmp = uint(block.blockhash(block.number - 1));
        return uint(keccak256(tmp,seed)) % 1000000000;
    }


    function Event(string eventTitle, address creator, uint max, uint cost, string description, string location, uint date) public {
        title = eventTitle;
        manager = creator;
        maxAttendees = max;
        ticketsSold = 0;
        ticketCost = cost;
        eventDescription = description;
        eventLocation = location;
        eventDate = date;
    }

    function buyTicket(string name) public payable {
        require(blacklist[msg.sender] != true);
        require(ticketsSold != maxAttendees);
        require(attendees[msg.sender].valid == false);
        require(msg.value == ticketCost);


        Attendee memory attendee = Attendee({
            valid: true,
            name: name,
            ticketNumber: (maxAttendees - ticketsSold),
            confirmed: false,
            amountPaid: ticketCost,
            confirmationCode: 0
        });

        ticketsSold++;
        attendees[msg.sender] = attendee;
    }


    function challengeAttendee(address attendee, uint seed) public restricted returns (uint) {
        require(attendees[attendee].valid == true);
        uint code = random(seed);
        attendees[attendee].confirmationCode = code;
        return code;
    }

    function confirmTicketOwnerShip(uint code) public {
        require(attendees[msg.sender].confirmationCode != 0);


        attendees[msg.sender].confirmed = attendees[msg.sender].confirmationCode == code;

    }

    function confirmResponse(address attendee) public restricted view returns (bool) {
        return attendees[attendee].confirmed;
    }

    function addToBlackList(address blockedAddress) public restricted {
        blacklist[blockedAddress] = true;
    }


    function getEventDetails() public view returns (string, uint, uint, uint, string, string, uint) {
        return (
            title,
            maxAttendees,
            ticketsSold,
            ticketCost,
            eventDescription,
            eventLocation,
            eventDate
        );
    }

}
