pragma solidity ^0.6.0;

contract GatekeeperOne {

  address public entrant;

  function enter() public {
    entrant = tx.origin;
  }
  
  function debugEnter() external {
      this.enter{gas: 1}();
  }
}
