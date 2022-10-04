function getPlayersAddress() public payable {    
 require(msg.value >= 0.00000001 ether);
 players.push(msg.sender); 
}
