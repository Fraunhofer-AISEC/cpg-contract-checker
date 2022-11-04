pragma solidity ^0.4.8;

contract Test {
  uint public myVal;

  modifier onlySelf(){
      if (msg.sender != address(this)) throw;
      _;
  }

  function callIt() {
      this.call.gas(50000)(bytes4(sha3("setMyVal(uint256)")), 123);
  }

  function setMyVal(uint _newVal) onlySelf {
      myVal = _newVal;
  }
} 
