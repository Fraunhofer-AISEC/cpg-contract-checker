pragma solidity ^0.5.0; 


contract Courses {

struct Instructor {
    uint age;
    string fName;
    string lName;
}

mapping (address => Instructor) instructors;
address[] public instructorAccts;

function setInstructor(address _address, uint _age, string memory _fName, string memory _lName) public {
    var instructor = instructors[_address];

    instructor.age = _age;
    instructor.fName = _fName;
    instructor.lName = _lName;

    instructorAccts.push(_address) -1;
}

function getInstructors() public view returns ( address[]) {
    return instructorAccts;
}
}
