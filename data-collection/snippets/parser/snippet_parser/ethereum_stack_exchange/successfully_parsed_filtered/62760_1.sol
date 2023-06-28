pragma solidity ^0.4.24;

contract ViewVsPure {
  uint public age = 18;

  function addToAge(uint _no) public view returns (uint){
    return age + _no;
  }

  function add(uint _a, uint _b) public pure returns (uint) {
    return _a + _b;
  }
}
