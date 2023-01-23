function buySomethingAndReturnChange() payable{
  uint minAmount = 3000;
  require (msg.value >= minAmount);
  uint moneyToReturn = msg.value - minAmount; 

  boughtSomething = true;
  if(moneyToReturn > 0)
    msg.sender.transfer(moneyToReturn);
}
