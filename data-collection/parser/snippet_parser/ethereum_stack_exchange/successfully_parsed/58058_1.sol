pragma solidity ^0.4.24;

contract StudentManager {
    uint[] public studentList;

    struct Student {
        bool valid;
        uint index;
        string name;
        uint age;
        bool tookTest;
    }

    mapping(uint => Student) public students;

    
    function upsert(uint ID, string _name, uint _age, bool _tookTest) external {
        Student storage student = students[ID];
        if (!student.valid) {
            student.valid = true;
            student.index = studentList.length;
            studentList.push(ID);
        }
        student.name = _name;
        student.age = _age;
        student.tookTest = _tookTest;
    }

    
    function remove(uint ID) external {
        Student storage student = students[ID];
        require(student.index < studentList.length);
        require(ID == studentList[student.index]);
        uint lastStudent = studentList[studentList.length - 1];
        students[lastStudent].index = student.index;
        studentList[student.index] = lastStudent;
        studentList.length -= 1;
        delete students[ID];
    }

    
    function studentCount() external view returns (uint) {
        return studentList.length;
    }
}
