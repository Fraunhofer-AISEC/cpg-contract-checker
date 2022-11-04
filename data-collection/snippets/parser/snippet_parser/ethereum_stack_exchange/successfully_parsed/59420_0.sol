pragma solidity ^0.4.20;

 struct Student{

  uint id;
  string name;
  uint256 mark;

 }

 mapping(uint => Student[]) StudentDetails;

function addStudent(uint classid,uint id,string name,uint256 mark) public payable{

     StudentDetails[classid].push(Student(id,name,mark));
  }
