
pragma solidity ^0.7.1;

contract A {
  uint public value;

  function setV(uint _x) public { value = _x; }
  function getV() public view returns (uint) { return value; }
}
