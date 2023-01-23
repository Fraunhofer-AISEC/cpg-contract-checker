
pragma solidity ^0.8.0;

import "./SimpleStorage1.sol";

contract StorageFactory{
    uint256 counter;

    struct ownerAndThereContracts{
        string name;
        address nf; 
    }

    ownerAndThereContracts[] public saveYourContracts;
    SimpleStorage1[] public x;

    function createNewContracts() public {
        SimpleStorage1 simpleStorage = new SimpleStorage1();  
        x.push(simpleStorage);
    }

    function refering(string memory _name) public {
        
        
        counter = x.length-1;
        SimpleStorage1 simpleStorage2 = SimpleStorage1(x[counter]);
        
        saveYourContracts.push(ownerAndThereContracts(_name,address(simpleStorage2)));
    }
}
