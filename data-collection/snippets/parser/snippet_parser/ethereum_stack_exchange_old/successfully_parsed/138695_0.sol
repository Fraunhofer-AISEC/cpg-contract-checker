
pragma solidity ^0.8.0;

contract StructExample {

    
    struct Person {
        uint256 age;
        string name;
    }

    
    function storageDemo() public {
        Person storage person;
        
    }

    
    function memoryDemo() public {
        Person memory person;
        
    }
}
