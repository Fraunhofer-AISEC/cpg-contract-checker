 function setStudent (address _address, string _grade, string _fName, string _lName, string _email, string _className) public {
    var student = Students[_address];

    
    student.grade = _grade;
    student.studentAddr = _address;
    student.fName = _fName;
    student.lName = _lName;
    student.email = _email;
    student.className = _className;

    studentAccts.push(_address) -1;
}
