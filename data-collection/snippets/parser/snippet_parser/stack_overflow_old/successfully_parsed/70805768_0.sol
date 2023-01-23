
pragma solidity ^0.8.11;

contract lottery
{
  address manager;
  address[] public players;

  function setManager() public{
      manager = msg.sender;
  }
  function enterLottery () public payable{
    require(msg.value > 0.9 ether);
    players.push(msg.sender); 
  }
function random() private view returns(uint){
     return uint(keccak256(block.difficulty,block.timestamp,players));
  }
  function winner() public payable{
      uint index = random() % players.length;
      players[index].send(address(this).balance);
      players = new address[](0);
  }
}
