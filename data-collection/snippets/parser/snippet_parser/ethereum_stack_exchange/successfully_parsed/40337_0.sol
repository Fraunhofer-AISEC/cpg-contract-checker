pragma solidity ^0.4.18;

contract Test {
  bool completed;

  function Test() {
    completed = false;
  }

  function setCompleted() public {
    completed = true;
  }

  function getCompleted() public view returns (bool) {
    return completed;
  }
}
