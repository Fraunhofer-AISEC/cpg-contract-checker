pragma solidity >=0.5.0 <0.6.0;

contract Courses {

    struct Instructor {
        string  age; 
        string  fName;
        string  lName;
    }

    mapping (address => Instructor) public instructors; 
    address[] public instructorAccts;

    function setInstructor(address _address, uint256 _age, string memory _fName, string memory _lName) public {

        Instructor memory instructor = Instructor(_age, _fName, _lName); 
        instructor[_address] = instructor;
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;

        instructorAccts.push(_address) -1;
    }

    function getInstructors() view public returns(address[] memory) {
        return instructorAccts;
    }

    function getInstructor(address _address) view public returns (uint, string memory, string memory) {
        return (instructors[_address].age, instructors[_address].fName, instructors[_address].lName);
    }

    function countInstructors() view public returns (uint256) {
        return instructorAccts.length;
    }

}
