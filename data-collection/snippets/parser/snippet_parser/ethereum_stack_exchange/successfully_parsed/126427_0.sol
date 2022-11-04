
pragma solidity ^0.8.4;

contract Coin {
    
    
    address public minter;

    
    
    constructor() {
        minter = msg.sender;
    }
}
