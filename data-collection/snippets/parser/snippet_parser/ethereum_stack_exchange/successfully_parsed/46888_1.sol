pragma solidity ^0.4.16;

contract FunctionTest {

    bool public foo; 
    
    bytes32 public name; 
    uint256 public counter;

    
    constructor() public{
        
        foo = true;
        counter = 0;
    }

    function setName(bytes32 _name) public {
        
        require(_name > 0);
        name = _name;
    }

    function writeToStorage() public {
        foo = !foo;
    }

    function readFromStorageConstant() public constant returns (bool) {
        return foo;
    }

    function readFromStorageView() public view returns (bool) {
        return foo;
    }

}
