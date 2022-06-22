contract Factory {
  ...
  
  event ContractCreated(address _contract, bytes32 _name, uint _index);

  function createContract (bytes32 name) public {
    address newContract = new Contract(name);
    newContracts.push(newContract);

    
    ContractCreated(newContract, name, newContracts.length - 1);
  } 
