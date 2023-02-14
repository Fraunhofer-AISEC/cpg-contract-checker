
pragma solidity ^0.8.0;

contract Example {

  uint256[] myArray;

  function addElement(uint256 value) public {
    myArray.push(value);
  }
}
