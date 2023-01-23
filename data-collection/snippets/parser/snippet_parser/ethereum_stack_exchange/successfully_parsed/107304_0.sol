pragma solidity ^0.5.2;

contract BPToken {
    uint256 public totalSupply; 

    mapping(address => uint256) public balanceOf;


    constructor(uint256 _initialSupply) public { 
        totalSupply = _initialSupply;
    }
}
