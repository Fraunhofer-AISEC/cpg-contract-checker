pragma solidity >=0.5.0 <0.7.0;

contract fnTypeExample {

    string public  _name;
    
    constructor() public {
        _name = "hello anish";
    }

    function f() view public{
        
        modifyName(_name);
    }

    function modifyName(string storage name) pure internal {
    
        string memory name1 = name;
        bytes(name1)[0] = 'D';
    }
    
    function getName() public view returns (string memory) {
        return _name;
    }
}
