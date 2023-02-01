pragma solidity ^0.5.0;

contract Test{

  function TestVar() view public returns(uint8){
    uint8 a;
    for(uint8 b=0;b<20; b++){
      a=b;
      return a;
    }
  }   
}
