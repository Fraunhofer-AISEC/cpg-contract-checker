pragma solidity ^0.4.17;

contract GamescoreOracle {
  address public owner;
  string public gameWinner;
  event CallbackGetGameWinner();

  constructor() public {
    owner = msg.sender;
  }

  function updateGameWinner() public {
    emit CallbackGetGameWinner();
  }

  function setWinningTeam(string teamname) public {
    require(msg.sender == owner, "Err: Not Authorized");
    gameWinner = teamname;
  }

  function getGameWinner() public view returns (string) {
    return gameWinner;
  }
}
