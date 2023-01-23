function expensiveTransfer() public {
  uint maxGasLeft = gasleft();
  require(maxGasLeft > 5000000);
  maxGasLeft -= 5000000;

  ...normal function logic...

  while(gasleft() > maxGasLeft) {
    
  }
}
