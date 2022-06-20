SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
struct stu {
    string name;
    uint age;
    bool tookTest;
}
contract Student{
    mapping(uint => stu) public studentNames;
    function addStudent (uint ID, string memory _name, uint _age) public {
        studentNames[ID] = stu(_name, _age, false);
    }
    function updateStudent (uint ID) public {
        studentNames[ID].tookTest = true;
    }
}
contract ClassRoom {
    address studentAddr;
    Student student;
    stu public test;
    function classRoom(address addr) public {
        studentAddr = addr;
        student = Student(addr);
    }

    
    function updateTookTest (uint ID) public {
        student.updateStudent(ID);
    }
    
    function readStudentStruct (uint ID) public {
        test = student.studentNames(ID);
    }
}
