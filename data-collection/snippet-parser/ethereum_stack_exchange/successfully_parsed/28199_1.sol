contract ContractFoo {
  mapping (address=>uint) somemapping; 

  function getMapping(address _address) public constant returns (uint) {
    return somemapping[addr]
  }
}
