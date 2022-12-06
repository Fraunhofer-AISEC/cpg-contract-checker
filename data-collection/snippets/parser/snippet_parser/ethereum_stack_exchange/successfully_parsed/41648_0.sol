pragma solidity ^0.4.18;

contract Courses {

struct Instructor {
    uint age;
    string fName;
    string lName;
}

mapping (address => Instructor) instructors;
address[] public instructorAccts;

function setInstructor(address _address, uint _age, string _fName, string _lName) public {
    instructors[_address].age = _age;
    instructors[_address].fName = _fName;
    instructors[_address].lName = _lName;

    instructorAccts.push(_address) -1;
}

function getInstructors() view public returns(address[]) {
    return instructorAccts;
}

function getInstructor(address _address) view public returns (uint, string, string) {
    return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
}

function countInstructors() view public returns (uint) {
    return instructorAccts.length;
}

}
