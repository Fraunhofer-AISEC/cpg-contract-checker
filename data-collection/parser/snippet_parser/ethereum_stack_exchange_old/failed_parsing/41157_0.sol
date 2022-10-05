pragma solidity ^0.4.18;

contract CA3 {

struct Student {
        uint16 age;
    uint16 income;
    uint16 score;
    uint16 attendance;
}
Student[] public students;

function setStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendan
ce) public {
   Student memory tempStudent = Student({age: _age, income: _income, score: _scor
e, attendance: _attendance});
        students.push(tempStudent);

attendance}));


}

}

> con.setStudent(8,1,1,1)
"0x9886c2de6ace867efedc4c06d2fa79d7148807287a827d2f31a6f01956d6b4ca"

> con.students(0)
[8, 1, 1, 1]

> eth.getStorageAt(con.address,0)
"0x0000000000000000000000000000000000000000000000000000000000000001"
