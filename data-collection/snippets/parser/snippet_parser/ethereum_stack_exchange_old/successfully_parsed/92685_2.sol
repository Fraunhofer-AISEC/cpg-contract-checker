pragma solidity ^0.6.0;

contract parent {
    child public childContract;
    uint public num;
    
    constructor() public {
        childContract = new child(address(this));
    }
    
    function setValue(uint _value) public {  
        num = _value;  
    }
    
    function getValue() public view returns(uint) {  
        return num;  
    }  
}


contract child {
    parent parentInstance;
    constructor(address _parent_address) public {
        parentInstance = parent(_parent_address);
    }
    
    function getParentValue() public view returns(uint){  
        return parentInstance.getValue();
    }  
    
    function setParentValue(uint _child_value) public {
        parentInstance.setValue(_child_value);
    }  
}
