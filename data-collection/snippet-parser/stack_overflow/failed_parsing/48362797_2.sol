pragma solidity ^0.4.16;

contract FunctionTest {
  bool public foo = true;
  string public name;
  uint256 public counter = 0;

  function setName(string _name) public {
    name = _name;
  }

  function increaseCounter() public {
    counter += 10;
  }

  function writeToStorage() {
    foo = !foo;
  }

  function readFromStorageConstant() public constant returns (bool) {
    return foo;
  }

  function readFromStorageView() public view returns (bool) {
    return foo;
  }

  funciton increaseCounter() {
    counter += 10; } 
}
