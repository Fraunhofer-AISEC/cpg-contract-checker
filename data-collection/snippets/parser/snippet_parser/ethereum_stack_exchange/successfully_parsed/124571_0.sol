
pragma solidity ^0.8.0;

contract Destruct {

    address owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    function callSelfDestruct() onlyOwner public {
        selfdestruct(payable(owner));
    }
}
