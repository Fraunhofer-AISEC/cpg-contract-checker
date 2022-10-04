contract ContractARegistry {
  mapping(address => address[]) user_contracts;

  function registerContract(address contractA) public {
    user_applications[msg.sender].push(contractA) - 1; 
  }

  function findContract(address user) view public returns (address[]){
    return user_contracts[user];
  }
}
