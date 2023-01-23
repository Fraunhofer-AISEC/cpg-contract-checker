pragma solidity ^0.4.0;
contract Student{

    struct stu{
        address name;
        uint age;
        bool tookTest;
        address[] books;
    }

    stu public s;

    mapping(uint => stu) public StudentNames;

    function addStudent (uint ID, address _name, uint _age,address[] books) {
        StudentNames[ID] = stu(_name, _age, false, books);
    }
    function updateStudent (uint ID) {
        StudentNames[ID].tookTest = true;
    }

    function getBooks(uint ID) returns(address[]){
        return StudentNames[ID].books;
    }

}
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

    
    function readStudentStruct (uint ID) constant returns (address, uint, bool) {
        return student.StudentNames(ID);
    }

   
   function readStudentStruct (uint ID) constant returns (address, uint, bool,address[]) {
        return student.StudentNames(ID);
    }
}
