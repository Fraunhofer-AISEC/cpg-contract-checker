pragma solidity ^0.8.4;

contract Contract {
    address payable public owner;

    constructor() public {
     owner=payable(msg.sender);

    }
    
}
