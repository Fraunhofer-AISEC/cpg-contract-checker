pragma solidity ^0.4.18;

contract CA3 {

struct Student {
        uint16 age;
    uint16 income;
    uint16 score;
    uint16 attendance;
}

struct Employee {
    uint16 age;
    uint16 income;
    uint16 timeWorked;
}
Student[] public students;
Employee[] public employees;
function setStudent (uint16 _age, uint16 _income, uint16 _score, uint16 _attendan
ce) public {
   Student memory tempStudent = Student({age: _age, income: _income, score: _scor
e, attendance: _attendance});
        students.push(tempStudent);

attendance}));


}
function setEmployee(uint16 _age, uint16 _income, uint16 _timeWorked) public {
Employee memory tempEmployee = Employee({age: _age, income: _income, timeWorked: 
_timeWorked});
employees.push(tempEmployee);
}

}
