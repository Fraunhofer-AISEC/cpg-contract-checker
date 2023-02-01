function setInstructor(address _address, uint _age, string _fName, string _lName) public returns(uint256){
    var instructor = instructors[_address];

    instructor.age = _age;
    instructor.fName = _fName;
    instructor.lName = _lName;

    return instructorAccts.push(_address) -1;
}
