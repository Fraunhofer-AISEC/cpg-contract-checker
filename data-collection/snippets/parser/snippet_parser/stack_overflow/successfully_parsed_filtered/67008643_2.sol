pragma solidity ^0.8.0;

contract LuggageStorage {
    address owner;
    
    constructor(address _owner) {
        owner = _owner;
    }
    
    function retrieveLuggage() public {
        require(msg.sender == owner, "Can by only requested by the owner");
        
    }
}
