 struct Meeting {
        address meeting_creator;
        uint256 meetingID;
        string name;
        string description;
        uint256 start_date;
        uint256 end_date;
        uint256 max_tickets;
        uint256 ticket_price;
        uint256 current_tickets_sold;
        address[] attendees;
        mapping(address => bool) hasRSVPed;

    }

Meeting[] public meetingArray;

function create_meeting(string memory _name, string memory _description, uint _startTime, uint _endTime, uint _maxTickets,
    uint256 _ticketPrice) public returns (uint256 meetingID) {

        address[] memory adr;
        mapping(address => bool) memory RSVPed;

        totalMeetings += 1;
        meetingID = totalMeetings;

        meetingArray.push(Meeting(msg.sender, meetingID, _name, _description, _startTime, _endTime, _maxTickets, _ticketPrice, 0, adr, RSVPed));

        Meeting storage m = meetings[totalMeetings];
        m.meeting_creator = msg.sender;
        m.meetingID = meetingID;
        m.name = _name;
        m.description = _description;
        m.start_date = _startTime;
        m.end_date = _endTime;
        m.max_tickets = _maxTickets;
        m.ticket_price = _ticketPrice;
        m.current_tickets_sold = 0;
        m.attendees = adr;
        m.hasRSVPed = RSVPed;
}
