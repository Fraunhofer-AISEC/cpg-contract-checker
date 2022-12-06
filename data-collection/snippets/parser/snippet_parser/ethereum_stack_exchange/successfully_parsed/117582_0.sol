pragma solidity ^0.8.7;

contract SomeContract {

  address public manager;
  uint public theNumberNine;
  mapping (string => mapping (address => uint)) public stringToAddrToInt;

  constructor() {
    manager = msg.sender;
    theNumberNine = 9;
  }

  function setInt(string memory someString) public {
    stringToAddrToInt[someString][msg.sender] = theNumberNine;
  }

  function getIntFromMapping(string memory someString) public view returns (uint) {
    return stringToAddrToInt[someString][msg.sender];
  }
}

