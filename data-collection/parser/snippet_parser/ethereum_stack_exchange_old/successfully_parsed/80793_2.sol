pragma solidity ^0.6.4;

contract Mortal {
    
    address payable owner;

    
    constructor() public { owner = msg.sender; }

    
    function kill() public {
        if (msg.sender == owner) 
            selfdestruct(owner); 
    }
}
