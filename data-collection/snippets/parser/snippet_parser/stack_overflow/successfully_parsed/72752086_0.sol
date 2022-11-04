contract ContractA {
  
}
contract ContractB {
  ContractA contractA; 
  constructor (address addr) {
    contractA = ContractA(addr);
  }
}
