pragma solidity ^0.4.18;

contract CollegeAdmin {
    uint public studentAge=18;
    uint public studentIncome=15000;
    uint public studentScore=4;
    uint public studentAttendance=96;
    event changedAge(uint age);

    function setAge(uint age) public {
        studentAge = age;
        changedAge(age);
    }

}
