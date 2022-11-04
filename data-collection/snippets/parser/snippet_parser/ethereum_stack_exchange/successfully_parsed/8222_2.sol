contract ClassRoom {
    address studentAddr;
    Student student;
    function ClassRoom(address addr) {
        studentAddr = addr;
        student = Student(addr);
    }

    
    function updateTookTest (uint ID) {
        student.updateStudent(ID);
    }
    
    function readStudentStruct (uint ID) constant returns (string, uint, bool) {
        return student.studentNames(ID);
    }
}
