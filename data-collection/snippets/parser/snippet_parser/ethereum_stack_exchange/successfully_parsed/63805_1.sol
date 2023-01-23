contract MarkAttendance {

struct AttendeeDetails {
    address attendance_giver;
    address attendee;
    uint attendance_opinion;
    uint256 timestamp;
    uint256 date_of_attendance;
}


mapping(uint => AttendeeDetails) public attendeeDetails;
uint public attendeeDetailsCount;

function markAttendance(address _attendee, uint _attendance_opinion, uint256 _date) public {
    attendeeDetailsCount ++;
    attendeeDetails[attendeeDetailsCount] = AttendeeDetails(msg.sender, _attendee, _attendance_opinion, now, _date);
    }
}
