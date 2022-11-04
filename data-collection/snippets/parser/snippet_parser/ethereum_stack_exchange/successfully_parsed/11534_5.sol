 pragma solidity ^0.4.2;

contract MyContract {
    bytes32 public Name;

    function MyContract (bytes32 name) {
        Name = name;
    }
}


contract Factory {
    bytes32[] public names;
    address[] public contracts;

    function createContract(bytes32 name) returns(address) {
        address newContract = new MyContract(name);
        names.push(name);
        contracts.push(newContract);
        return newContract;
    }

    function getName(uint i) constant returns(bytes32 contractName) {
        return names[i];
    }

    function getAddress(uint i) constant returns(address contractAddress) {
        return contracts[i];
    }
}
