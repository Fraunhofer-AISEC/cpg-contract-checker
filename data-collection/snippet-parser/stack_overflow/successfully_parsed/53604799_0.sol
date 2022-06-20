pragma solidity ^0.5.0;

contract Lottery{
 address public manager;
 address payable [] public players;

 modifier restricted {
     require(msg.sender == manager);
     _;
 }

 constructor() public {
     manager = msg.sender;
 }

 function participate() public payable {
     require(msg.value > .01 ether);
     players.push(msg.sender);
 }

 function pseudoRandom() private view returns(uint){
     return uint(keccak256(abi.encodePacked(block.difficulty, now, players)));
 }

 function pickWinner() public restricted {
     require(msg.sender == manager);
     uint index = pseudoRandom() % players.length;
     address(players[index]).transfer(address(this).balance);
     (players) = new address payable[](0);
 }

 function getPlayers() public view returns(address payable[] memory){
     return players;
 }  
}
