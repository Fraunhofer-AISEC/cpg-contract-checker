pragma solidity ^0.8.4;

contract Market {
    public address productAddr;

    constructor(address addr) {
        productAddr = addr;
    }

    function foo() external {
        require(msg.sender == productAddr, "nope!");
        
    }
}
