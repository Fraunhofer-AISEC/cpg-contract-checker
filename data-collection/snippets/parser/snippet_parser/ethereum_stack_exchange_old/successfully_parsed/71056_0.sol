pragma solidity ^0.5.0;

contract TestContract{
  uint public a;
  uint public b;

constructor(uint _a, uint _b) public {
  a = _a;
  b = _b;
}

function TestFunc(uint c, uint d) public view returns(bool success){
  if (c == d){
    return false;
  }
  else{
      return true;
  }
}}
