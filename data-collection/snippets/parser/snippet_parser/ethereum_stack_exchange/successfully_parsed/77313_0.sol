event GameResult(bool won);


function lottery(uint8 guess) public payable returns(bool){
  uint8 result = 1;
  bool won = false;
  if (guess == result) {
    
    msg.sender.transfer(msg.value * 2);
    won = true;
  }
  emit GameResult(won);
}
