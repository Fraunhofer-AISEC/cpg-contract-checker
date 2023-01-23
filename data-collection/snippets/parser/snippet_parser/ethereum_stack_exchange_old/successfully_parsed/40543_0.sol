pragma solidity ^0.4.18;

contract CollegeAdmin {
    uint8 public studentAge=18;
    uint16 public studentIncome=15000;
    uint8 public studentScore=4;
    uint8 public studentAttendance=96;
    event changedAge(uint age);
    function setAge(uint8 age) public {
        studentAge = age;
        changedAge(age);
    }
}
