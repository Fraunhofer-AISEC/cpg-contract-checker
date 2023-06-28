pragma solidity ^0.4.2;

contract MyContract {
    bytes32 public Name;

    function MyContract (bytes32 name) {
        Name = name;
    }
}


contract Factory {
    bytes32[] public Names;
    address[] public newContracts;

    function createContract(bytes32 name) returns(address) {
        address newContract = new MyContract(name);
        newContracts.push(newContract);
        return newContract;
    }

    function getName(uint i) {
        MyContract con = MyContract(newContracts[i]);
        Names[i] = con.Name();
    }
}
