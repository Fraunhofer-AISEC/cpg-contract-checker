contract ClassRoom{

Student studentContract;
stu public test;

constructor(address _addr) {
    studentContract = Student(_addr);
}

function updateTookTest (uint ID) public {
}

function readStudentStruct (uint ID) public view returns(string memory, 
uint, bool) {

    stu memory student;
    (student.name, student.age, student.tookTest) = 
    studentContract.studentNames(ID);
    return (student.name, student.age, student.tookTest);
}
}
