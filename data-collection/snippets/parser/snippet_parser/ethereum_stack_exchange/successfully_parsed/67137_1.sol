pragma solidity >=0.4.0 <0.6.0;

contract arrayExample {
  
  uint[] public myArray;

  
  

  
  function getArray() returns (uint[] memory) {
      return myArray;
  }
}
