pragma solidity ^0.8.0;

modifier onlyOwner() {
        require(msg.sender == owner, "Only contract owner can call this function.");
        _;
    }
