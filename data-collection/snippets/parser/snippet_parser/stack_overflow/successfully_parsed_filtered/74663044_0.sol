
pragma solidity ^0.8.0;


contract StorageFactory {

  struct ContractData {
    address contractAddress; 
    bool exists;
  }

  
  mapping(address => ContractData) public userAddressToStruct;

  function createStorageContract(address _userAddress) public {

    
    require(!userAddressToStruct[_userAddress].exists, "Account already exists");
    
    
    address contractAddress = address(new StorageContract(_userAddress));

    
    userAddressToStruct[_userAddress].contractAddress = contractAddress;
    userAddressToStruct[_userAddress].exists = true;
  }
}



contract StorageContract {
  address immutable deployedBy;

  constructor(address _deployedBy) {
    deployedBy = _deployedBy;
  }
}

