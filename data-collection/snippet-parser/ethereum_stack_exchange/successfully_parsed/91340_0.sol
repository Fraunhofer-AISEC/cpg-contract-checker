
pragma solidity ^0.8.0;

contract  MyContract{
    address manager;
    constructor(){
        manager = msg.sender;
    }
    
    function invalidate() public {
        require(msg.sender == manager); 
        manager = address(0);
    }
}