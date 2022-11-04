pragma solidity 0.8.0;

contract Players {
  address[] public players;

  function add() public {
    players.push(msg.sender);
  }

  function getTheLastUser() public {
  }
}
