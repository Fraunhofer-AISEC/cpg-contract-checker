pragma solidity ^0.4.8;

contract Test {
  uint public myVal;

  function callIt() {
      this.call.gas(50000)(bytes4(sha3("setMyVal(uint256)")), 123);
  }

  function setMyVal(uint _newVal) internal {
      myVal = _newVal;
  }
}
