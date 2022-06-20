contract C1 {

  function call (address myContractsAddress, uint aParameter) returns(uint){
    C2 c2= new C2(myContractsAddress);
    return c2.aFunction(aParameter);
  }
}

contract C2 {
  function aFunction(uint aParameter) returns(uint) {
    return 1;
  }
}
