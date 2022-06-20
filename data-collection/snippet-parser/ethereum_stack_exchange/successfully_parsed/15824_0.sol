pragma solidity ^0.4.11;
contract EventTest {                
  event NumberEvent(uint indexed number);   

  function triggerEvent(uint val) returns (uint) { 
    NumberEvent(val);
    return 123;
  }                                 
}
