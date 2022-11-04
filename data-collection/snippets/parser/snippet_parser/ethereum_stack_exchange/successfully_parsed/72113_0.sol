pragma solidity ^0.5.1;

contract Callee {
  uint private val;

  constructor() public{
    val = 30;
  }
  function getValue() public view returns(uint) {
      return val;
  }
  function increment() public returns(uint) {
    val = val + 1;
    return val;
  }
}
