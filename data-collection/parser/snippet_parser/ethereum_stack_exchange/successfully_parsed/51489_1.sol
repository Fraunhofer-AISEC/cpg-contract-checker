pragma solidity ^0.4.16;

contract Storage {

uint public mynum = 5;


  function getNumber() public constant returns (uint) {
    return mynum;
  }

 }
