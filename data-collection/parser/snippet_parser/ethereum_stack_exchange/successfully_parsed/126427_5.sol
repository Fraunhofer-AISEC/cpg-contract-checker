
pragma solidity ^0.8.4;

contract Coin {
    
    address public minter;
    bool public boolean = true;

    constructor() {
        assembly {
            sstore(0, caller())
        }
    }
}
