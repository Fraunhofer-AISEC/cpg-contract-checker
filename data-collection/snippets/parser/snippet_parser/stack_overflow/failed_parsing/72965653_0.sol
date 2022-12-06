function myFunction() external payable onlyOwner {
  ExternalContract contract = ExternalContract(address);
  uint result = contract.readFunction();
  required(result > 0, 'might failed here') 
  myCustomWriteLogic();
}
