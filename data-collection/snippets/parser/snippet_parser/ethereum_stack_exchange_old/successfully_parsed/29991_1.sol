function multiplicate(address adr) payable
{
  require (contractBalance + msg.value <= this.balance); 
  if(msg.value >= contractBalance)
  { 
    contractBalance += msg.value;
    uint moneyToTransfer = contractBalance;
    contractBalance = 0;
    adr.transfer(moneyToTransfer);
  }
}
