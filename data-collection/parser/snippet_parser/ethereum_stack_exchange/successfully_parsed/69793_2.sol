function setInstructor(address _address, uint256 _age, string memory _fName, string memory _lName) public {
    Instructor storage instructor = instructors[_address];
    instructor.age = _age;
    instructor.fName = _fName;
    instructor.lName = _lName;
    instructorAccts.push(_address) -1;
}
