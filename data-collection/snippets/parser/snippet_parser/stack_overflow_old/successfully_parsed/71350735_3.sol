pragma solidity ^0.8.7;     

contract Lottery 
  {
   address public manager;
   address[] public players;

 constructor() 
  { 
        manager = msg.sender;
  }

function enter() public payable
 {
        require(msg.value > .01 ether);
        players.push(msg.sender);
 }
function random() private view returns (uint256)
 {
   return
   uint256(keccak256(abi.encodePacked(block.difficulty, block.timestamp, players)));
 }

function pickWinner() public restricted 
{
    require(msg.sender == manager);
    uint256 index = random() % players.length;
    uint256 amount = address(this).balance;
    payable(players[index]).transfer(amount);
    players = new address[](0); 
}

modifier restricted() 
{
    require(msg.sender == manager);
    _;
}

function getPlayers() public view returns (address[] memory) 
{
    return players;
}
}
