pragma solidity ^0.5.1;

contract Factory {
    address[] public newContracts;

    function createContract (string memory name) public{
        address newContract = address(new MyContract(name));
        newContracts.push(newContract);
    } 
}

contract MyContract {
    string public Name;

    constructor (string memory name) public {
        Name = name;
    }
}
