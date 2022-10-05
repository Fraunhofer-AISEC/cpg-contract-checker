function setInstructor(address _address, uint _age, string _fName, string _lName) public {
        
        instructors[_address].age = _age;          
        instructors[_address].fName = _fName;          
        instructors[_address].lName = _lName;         
        
        instructorAccts.push(_address) -1;
    }
