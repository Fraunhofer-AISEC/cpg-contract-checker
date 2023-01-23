pragma solidity ^0.6.6;

contract Factory {
    mapping(address => address) public children; 

    function createChild() external {    
        
        Child child = new Child(msg.sender);

        
        children[msg.sender] = address(child);
    }

    function getChild() external view returns (address) {
        return children[msg.sender];
    }        
}

contract Child {
    address public owner;
    
    constructor(address _owner) public {
        owner = _owner;
    }
    
    function getOwner() public view returns(address) {
        return owner;
    }
}
