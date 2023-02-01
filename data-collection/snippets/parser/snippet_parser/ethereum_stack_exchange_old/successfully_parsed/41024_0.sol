pragma solidity ^0.4.18;

contract CA2 {

  mapping (uint => Student) public students;

  struct Student {
        address studentAccount;
        uint age;
        uint income;
        uint score;
        uint attendance;
  }
  uint public studentCount;

  function setStudent (uint age, uint income, uint score, uint attendance) public {
    studentCount++;
    students[studentCount]=Student(msg.sender,age,income, score,attendance);
  }

}
