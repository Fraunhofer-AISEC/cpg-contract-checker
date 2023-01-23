struct Instructor {
    uint256 age; 
    string  fName;
    string  lName;
}

...

function setInstructor(address _address, uint256 _age, string memory _fName, string memory _lName) public {
    Instructor memory instructor = Instructor(_age, _fName, _lName); 
    instructors[_address] = instructor; 
