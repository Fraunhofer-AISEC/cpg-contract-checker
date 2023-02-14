pragma solidity ^0.4.0;
contract AddInteger{
  uint private c;

function addition(uint _a, uint _b) public constant returns(uint)
  {
     c = _a+_b;
     return c;
  } 
}
