
pragma solidity 0.8.0;

contract Players {
  address[] public players;

  function add() public {
    players.push(msg.sender);
  }

  function getTheLastUser() external view returns(address) {
    uint lastIndex = players.length-1;
    return players[lastIndex];
  }

  function getLengthArray() external view returns(uint) {
    return players.length;
  }
}
