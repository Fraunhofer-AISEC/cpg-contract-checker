
pragma solidity ^0.8.4;

contract ParentContract {
    
    ChildContract private child;

    constructor() {
        
        child = new ChildContract("Test", 30);
    }
}

contract ChildContract {
    
    string name;
    uint age;

    constructor(string memory _name, uint _age) {
        name = _name;
        age = _age;
    }
}
