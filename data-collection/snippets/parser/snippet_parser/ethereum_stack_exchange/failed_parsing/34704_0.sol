
pragma solidity ^0.4.16;

contract FunctionTest {

  bool public foo = true;
  string public name;
  uint256 public counter = 0;

  function setName(string name) public string returns(string) {
    string a = name;
    return a;
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

  function increaseCounter(uint256 counter)  public returns(uint256)
  {
    counter = counter + 10;
    return counter;
  }
}
