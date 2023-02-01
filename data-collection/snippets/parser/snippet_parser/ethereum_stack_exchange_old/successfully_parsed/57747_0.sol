pragma solidity ^0.4.17;

contract Lottery{
address public manager;
address[] public players;

constructor() public payable{
 manager = msg.sender;   
}

function enter() public payable {
    require(msg.value > 0.01 ether);

    players.push(msg.sender);
}

function random() private view returns(uint){
  return uint(keccak256(block.difficulty, now, players));
}

function pickWinner() public {
    uint index = random() % players.length;
    players[index].transfer(this.balance);
}
}
