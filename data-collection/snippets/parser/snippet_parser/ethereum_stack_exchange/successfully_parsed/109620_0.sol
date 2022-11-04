pragma solidity ^0.5.0;
contract C {
  uint public data = 30;
  uint internal iData= 10;
  
  function x() public returns (uint) {
     data = 3; 
     return data;
  }
}
contract Caller {
  C c = new C();
  function f() public view returns (uint) {
     return c.data(); 
  }
}
contract D is C {
  function y() public returns (uint) {
     iData = 3; 
     return iData;
  }
  function getResult() public view returns(uint){
     uint a = 1; 
     uint b = 2;
     uint result = a + b;
     return storedData; 
  }
}
