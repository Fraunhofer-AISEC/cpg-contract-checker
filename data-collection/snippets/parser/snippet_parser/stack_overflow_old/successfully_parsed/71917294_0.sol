pragma solidity ^0.4.17;

contract Lottery {
    address[] public players;
 
    function enter() public payable {
        require(msg.value > .01 ether);
        players.push(msg.sender);
    }
    
    function pickWinner() public {
        players[0].transfer(this.balance);
        players = new address[](0); 
    }
    
}
