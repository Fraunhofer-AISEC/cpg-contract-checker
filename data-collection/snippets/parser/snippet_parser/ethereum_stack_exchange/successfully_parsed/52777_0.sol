contract Courses is Owned {

    struct Instructor {
        uint age;
        string fName;
        string sName;
    }

    mapping (address => Instructor) instructors;
    address[] public instructorAccts;

    function setInstructor(address _address, uint _age, string _fName, string _sName) onlyOwner public {

        var instructor = instructors[_address];

        instructor.age = _age;
        instructor.fName = _fName;
        instructor.sName = _sName;

        instructorAccts.push(_address) -1;
    }
}
