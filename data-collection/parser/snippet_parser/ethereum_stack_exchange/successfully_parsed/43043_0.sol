pragma solidity ^0.4.21;

contract ExampleContract {
    string public Name;

    function ExampleContract (string name) public {
        Name = name;
    }
}


contract Factory {
    address[] public contracts;

    function createContract(string name) public returns(address)  {
        address newContract = new ExampleContract(name);
        contracts.push(newContract);
        return newContract;
    }
} 
