pragma solidity ^0.4.20;

contract ValueStorage {

    
    
    
    uint value;
    


    
    
    
    function setValue(uint _value) public {
        value = _value;
    }
    


    
    
    
    function getValue() public view returns  (uint) {
        return value; 
    }
    
}
