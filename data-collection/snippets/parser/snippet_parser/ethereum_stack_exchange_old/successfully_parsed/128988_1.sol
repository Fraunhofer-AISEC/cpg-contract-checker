pragma solidity ^0.8.0;
contract meeting {
    uint totalMeetings;
    struct Meeting {
        address meeting_creator;
    }
    mapping(uint => bool) hasRSVPed;
    mapping(uint => Meeting) meetings;

Meeting[] private meetingArray;

function create_meeting(string memory _name, string memory _description, uint _startTime, uint _endTime, uint _maxTickets,
    uint256 _ticketPrice) public returns (uint256 meetingID) {

        address[] memory adr;
        totalMeetings += 1;
        Meeting storage m = meetings[totalMeetings];
        m.meeting_creator = msg.sender;
        hasRSVPed[totalMeetings] = true;
}
}