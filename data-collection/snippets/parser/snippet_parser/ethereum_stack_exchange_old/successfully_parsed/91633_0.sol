pragma solidity 0.7.0;

contract Hello {
    address owner;
    uint256 value;
    
    event initContract(address _owner);  
    constructor() {
        owner = msg.sender;
        emit initContract(owner);
    }
    
    
}
