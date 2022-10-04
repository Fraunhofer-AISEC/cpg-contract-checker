function setInstructor(address _address, uint _age, string _fName, string _lName) public {
    var instructor = instructors[_address];        
    instructor.age = _age;
    instructor.fName = _fName;
    instructor.lName = _lName;

    instructorAccts.push(_address) -1;
}
