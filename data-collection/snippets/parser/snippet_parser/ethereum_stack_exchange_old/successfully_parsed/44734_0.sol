pragma solidity ^0.4.19;

contract students{

    struct students{
        string fname;
        string lname;
        string course;      
    }

    mapping (address => students) studentsMappig;

    address[] public studentsArray;

    function setStudents(address _address, string _fname, string _lname,string _course) public{

        var student = studentsMappig[_address];

        student.fname = _fname;
        student.lname = _lname;
        student.course = _course;
        studentsArray.push(_address) -1;

    }

}
