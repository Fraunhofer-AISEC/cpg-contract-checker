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

    Student[] public students;
    ShortStudent[] public sstudents;

    function setStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendance, uint128 studentTranscript, bytes32 studentAccount) public {
        Student memory tempStudent = Student({age: _age, income: _income, score: _score, attendance: _attendance, studentTranscript: studentTranscript, studentAccount: studentAccount});
        students.push(tempStudent);
    }

    function ssetStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendance, uint128 studentTranscript) public {
        ShortStudent memory tempStudent = ShortStudent({age: _age, income: _income, score: _score, attendance: _attendance, studentTranscript: studentTranscript});
        sstudents.push(tempStudent);
    }
}
