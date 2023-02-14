function deposit() payable{
  uint amount = msg.value;
    uint tokens = amount * 10;
    transfer(msg.sender, tokens);
}
