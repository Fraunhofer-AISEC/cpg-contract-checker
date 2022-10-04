pragma solidity >=0.5.2 <0.6.0;

contract lottery {
  address public manager;
  address[] public players;
  string private managerRestriction = "Managers are not allowed in competition";
  string private playerRestriction = "Only manager can select winner";

  constructor() public {
    manager = msg.sender;
  }

  function allPlayer() public view returns (address[] memory){
    return players;
  }

  function enter() public payable {
    players.push(msg.sender);
  }

  function randomGenerator() private view returns (uint) {
    return uint(keccak256(abi.encodePacked(block.difficulty, now, players)));
  }

  function selectWinner() public restrictPlayer returns (address) {
    uint index = randomGenerator() % players.length;
    address payable selectedPlayer = address(uint160(players[index]));
    selectedPlayer.transfer(address(this).balance);
    players = new address[](0);
    return selectedPlayer;
  }

  modifier restrictManager() {
    require(msg.sender != manager, managerRestriction);
    _;
  }

  modifier restrictPlayer() {
    require(msg.sender == manager, playerRestriction);
    _;
  }
}
