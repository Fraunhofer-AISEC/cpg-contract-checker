pragma solidity ^0.6.0;

contract parent{  
    uint public num;  
    function setValue(uint _value) public{  
        num= _value;  
    }  
    function getValue() public view returns(uint){  
        return num;  
    }  
}  
contract child is parent{    
    function get_address() public view returns(address){  
        return address(parent);  
    }  
}  
