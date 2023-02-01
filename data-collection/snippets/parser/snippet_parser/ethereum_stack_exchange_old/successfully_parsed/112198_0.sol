pragma solidity ^0.8.0;

contract Courses {
    
    struct Instructor {
        uint age;
        string fName;
        string lName;
    }
    
    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

function setInstructor(address _address, uint _age, string _fName, string _lName) public {
        var instructor = instructors[_address]; 

        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        
        instructorAccts.push(_address) -1;

    }

}

