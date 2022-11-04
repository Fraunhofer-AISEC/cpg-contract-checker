pragma solidity ^0.4.8;

contract Test {
  uint public myVal;

  event LogNewVal(bool success, uint newVal);

  function doIt(uint newVal) returns(bool success) {
      bool s = setMyVal(newVal);
      LogNewVal(s, newVal);
      return true;
  }

  function setMyVal(uint _newVal) internal returns(bool success){
      myVal = _newVal;
      return true;
  }
}
