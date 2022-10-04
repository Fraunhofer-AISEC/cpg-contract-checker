pragma solidity 0.5.16;

contract ArrayStuff {

  bytes32[] d;

  function makeHuge() public {
      uint massive = uint(0)-uint(1); 
      d.length = massive;
  }
}
