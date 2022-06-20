pragma solidity ^0.4.18;

contract CA15 {

struct Student {
        uint16 age;
    uint16 income;
    uint16 score;
    uint16 attendance;
}

Student[] public students;
function setStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendance) public {
   Student memory tempStudent = Student({age: _age, income: _income, score: _score, attendance: _attendance});
        students.push(tempStudent);
}

}
