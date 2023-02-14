function ApproveAndCall(address dynContAddress, uint value){
  DynamicContract dynamicContractInstance = DynamicContract(dynContAddress);
  dynamicContractInstance.foo();

  return true;
}
