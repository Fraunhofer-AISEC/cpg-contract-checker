contract CollegeAdmin {
uint8 public studentAge=21;
uint16 public studentIncome=15000;
uint8 public studentScore=4;
uint8 public studentAttendance=96;
address public buyer;
address public owner;
event changedAge(uint age);

function CollegeAdmin() public {
owner = msg.sender;
}
function setAge(uint8 age) public {
buyer=msg.sender;
studentAge = age;
changedAge(age);
}

}
