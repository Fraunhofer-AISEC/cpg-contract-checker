pragma solidity ^0.5.1;

import "./Factory.sol";

contract YourContract {

    
    
    
    string public Name;
    string public Type;
    uint public Fee;
    address owner;

    
    
    
    constructor(string memory Name, string memory Type, uint Fee) public {
        owner = msg.sender;
        Name = Name;
        Type = Type;
        Fee = Fee;
    }
}