uint index = random() % players.length;
uint amount = address(this).balance; 
payable(players[index]).transfer(amount);
