pragma solidity ^0.5.0;

contract homeAutomation{
  string public greeting;

  constructor(string memory _greet) public {
    greeting=_greet;
  }

  function greet(string memory _gree) public {
    greeting =_gree;
  }
}
