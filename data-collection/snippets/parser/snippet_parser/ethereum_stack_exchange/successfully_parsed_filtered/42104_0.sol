pragma solidity ^0.4.18;

contract CA3 {

    struct  Student {
        uint16  age;
        uint16  income;
        uint16  score;
        uint16  attendance;
        uint128  studentTranscript;
        bytes32  studentAccount;
    }

    struct ShortStudent {
        uint16 age; 
        uint16 income; 
        uint16 score; 
        uint16 attendance; 
        uint128 studentTranscript;
    }

    struct Employee {
        uint16 age;
        uint16 income;
        uint16 timeWorked;
    }
    Student[] public students;
    Employee[] public employees;
    ShortStudent[] public sstudents;
    function setStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendance, uint128 studentTranscript, bytes32 studentAccount) public {
        Student memory tempStudent = Student({age: _age, income: _income, score: _score, attendance: _attendance, studentTranscript: studentTranscript, studentAccount: studentAccount});
        students.push(tempStudent);


    }
    function ssetStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendance, uint128 studentTranscript) public {
        ShortStudent memory tempStudent = ShortStudent({age: _age, income: _income, score: _score, attendance: _attendance, studentTranscript: studentTranscript});
        sstudents.push(tempStudent);


    }



    function getStudent (uint value) view returns (uint16, uint16, uint16, uint16, uint128, bytes32) {
        uint16 age = students[value].age;
        uint16 income = students[value].income;
        uint16 score = students[value].score;
        uint16 attendance = students[value].attendance;
        uint128 studentTranscript = students[value].studentTranscript;
        bytes32 studentAccount = students[value].studentAccount;
        return (age, income, score, attendance, studentTranscript, studentAccount);
    }

    function setEmployee(uint16 _age, uint16 _income, uint16 _timeWorked) public {
        Employee memory tempEmployee = Employee({age: _age, income: _income, timeWorked: _timeWorked});
        employees.push(tempEmployee);
    }

}
