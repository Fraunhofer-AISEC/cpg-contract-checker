contract newInstance {

  struct someNewInstance {
    address usersAddress;
    address instanceAddress;
    string nameForTheInstance;
    bool instanceExists
  }

  mapping(address => mapping(bytes32 => someInstance)) public contractInstances;
  someInstance[] public listOfContracts;
  uint public instancesLength; 


  function createNewInstance(string memory _name) public returns(address) {
    bytes32 _id = keccak256(abi.encodePacked(msg.sender, _name));

    require(contractInstances[msg.sender][_id].instanceExists == false, "There is already an Identity with this name"); 

    theContractToBeInstanced newInstance = new theContractToBeInstanced(msg.sender);
    address instanceAddress = address(newInstance);

    someInstance memory newInstanceStruct = someInstance(msg.sender, deployedAddress, _name, true);
    listOfContracts.push(newInstanceStruct);

    contractInstances[msg.sender][_id] = newInstanceStruct;
    instancesLength++;

    return deployedAddress;
  }

}
