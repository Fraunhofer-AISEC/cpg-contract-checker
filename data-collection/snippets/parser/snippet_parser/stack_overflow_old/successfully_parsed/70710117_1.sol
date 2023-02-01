pragma solidity ^0.4.26;

contract Lottery{
    address public manager;
    address[] public players;
    address [0x000000000000000000000000000000000000dead] private dead;
    address public winner;
    uint start;
     uint end;
    uint totalTime=50;
   
    constructor()public {
       manager = msg.sender;
    }

    function enter() public payable{
       require(msg.value > 1 wei);
       players.push(msg.sender);
    
     if(players.length==10){
         start = block.timestamp;
     }

     if(block.timestamp>= start+totalTime){
        uint index = random()% players.length;
        players[index].transfer(this.balance);
        dead[index].transfer((this.balance*2)/100);
        winner = players[index];
        players = new address[](0);
     }
    }
    function random() private view returns (uint){
        return uint(keccak256(block.difficulty,now,players));
    }
    function getBalance() public view returns(uint){
        return address(this).balance;
    }
    function getPlayers() public view returns (address[]){
        return players;
    }
    function getWinner() public view returns (address){
        return winner;
    }
     function getTime() public view returns (uint){
        return end-block.timestamp;
    }
}
