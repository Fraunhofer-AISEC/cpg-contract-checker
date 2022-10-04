contract students{

struct Students{
    string fname;
    string lname;
    string course;      
}

mapping (address => Students) studentsMappig;

address[] public studentsArray;

function setStudents(address _address, string _fname, string _lname,string _course) public{

    Students storage student = studentsMappig[_address];

    student.fname = _fname;
    student.lname = _lname;
    student.course = _course;
    studentsArray.push(_address);

}

}
