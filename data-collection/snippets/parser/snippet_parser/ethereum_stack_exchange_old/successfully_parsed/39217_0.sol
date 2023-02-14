pragma solidity ^0.4.19;

contract Lottery {
  address private owner;

  address[] public players;
  uint private lastCount;

  address[] public winners;
  uint[] public prizes;

  uint private min = 1 ether;
  uint private fee = 0.1 ether;

  function Lottery() public {
    owner = msg.sender;
  }

  function enter() public payable {
    address player = msg.sender;
    require(player != owner);
    require(msg.value >= min);
    players.push(player);
    owner.transfer(fee);
  }

  function () public payable {
    enter();
  }

  function getPlayersCount() public view returns (uint) {
    return players.length - lastCount;
  }

  function pick(uint index) public {
    require(msg.sender == owner);
    require(getPlayersCount() > 0);
    address winner = players[lastCount + index];
    require(winner != address(0));
    winners.push(winner);
    prizes.push(this.balance);
    lastCount = players.length;
    winner.transfer(this.balance);
  }

  function getWinnersCount() public view returns (uint) {
    return winners.length;
  }

  function getPlayers() public view returns (address[]) {
    return players;
  }

  function getWinners() public view returns (address[], uint[]) {
    return (winners, prizes);
  }
}
