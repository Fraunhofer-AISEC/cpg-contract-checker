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