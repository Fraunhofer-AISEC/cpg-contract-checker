pragma solidity ^0.4.23;

contract CoffeeNetworking{ 
    Usermapping u  = Usermapping(0x9B3a12cF7D8560DCd3d5D148cDCBCb9E1617D06F); 
    uint256 public version =1;
    

    constructor () public {
    
    }

    function addValue(uint a) public returns (bool){
        
        return u.addValue(a);
    }

    function getValue() public view returns (uint256){
        
        return u.getValue();
    }

    function setName(bytes32 name) public returns(bool){
        
        return u.setName(name);
    }

     function getName() public view returns(bytes32){
        
        return u.getName();
    }

}

contract Usermapping {
    uint256 public value;
    bytes32 public name;
    function addValue(uint a) public returns (bool);
    function getValue() public view returns(uint256);
    function setName(bytes32 nameSet) public returns(bool);
    function getName() public view returns(bytes32);
}
