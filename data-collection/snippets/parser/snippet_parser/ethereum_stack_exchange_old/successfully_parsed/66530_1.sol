pragma solidity ^0.5.0;

contract Locations {

    function doSomething() public pure returns (uint[] memory) {

    uint[] memory localMemoryArray1 = new uint[](3);
    localMemoryArray1[0] = 4;
    localMemoryArray1[1] = 5;
    localMemoryArray1[2] = 6;

    uint[] memory localMemoryArray2 = localMemoryArray1;
    localMemoryArray1[0] = 10; 
    return localMemoryArray2;
  }
} 
