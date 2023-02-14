

function buySomething() payable{
  uint exactAmount = 3000;
  require (msg.value == exactAmount);
  boughtSomething = true;
}
