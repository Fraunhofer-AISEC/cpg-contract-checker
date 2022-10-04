pragma solidity ^0.4.7;

contract ContractTest { 
    string public Name;

    function ContractTest (string name) {
        Name = name;
    }
}

contract FactoryTest { 
    address[2] newContracts;

    function createContract (string name) {
        address newContract = new ContractTest(name);
        newContracts[0]=newContract;
    }

    function getContract() returns(address) {
      return newContracts[0];
    }
}
