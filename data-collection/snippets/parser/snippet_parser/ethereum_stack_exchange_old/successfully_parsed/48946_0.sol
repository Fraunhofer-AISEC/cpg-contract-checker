
contract Appointment{
  enum AppointStatus {
    CREATED,
    CONFIRMED,
    IN_SESSION,
    COMPLETED,
    CANCELLED
  }

address public owner;
uint public id;
string public title;
AppointStatus public status;
uint public timeNow;
uint public timeBookedFor;

constructor(
uint _id,
string _title,
uint _timeNow,
uint _timeBookedFor
) 
public {
    owner = msg.sender; 
    id = _id;
    title = _title;
    doctor = _doctor;
    timeNow = _timeNow;
    status = AppointStatus.CREATED;
    timeBookedFor = _timeBookedFor;
}
}