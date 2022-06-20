pragma solidity ^0.4.18;

contract CA3 {

  uint public test=9;
  struct Student {
    uint age;
    uint income;
    uint score;
    uint attendance;
  }
  Student[] public students;
  uint public studentCount=0;

  function setStudent (uint _age, uint _income, uint _score, uint _attendance) public {
    test=19;
    students.push(Student({age: _age, income: _income, score: _score, attendance: _attendance}));    
  }    
}
