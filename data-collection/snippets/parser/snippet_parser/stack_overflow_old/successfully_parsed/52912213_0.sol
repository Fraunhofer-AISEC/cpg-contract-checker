pragma solidity ^0.4.25;


contract Contrato {

  string fName;
  uint age;

  function setInstructor (string _fName, uint _age){
      fName = _fName;
      age = _age;

  }

  function getInstructor () public constant returns (string, uint){
      return (fName, age);
  }

}
