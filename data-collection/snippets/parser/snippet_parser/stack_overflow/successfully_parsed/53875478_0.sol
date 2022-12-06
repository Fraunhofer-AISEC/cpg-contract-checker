pragma solidity ^0.4.24;

contract TestToken {
uint256 public totalSupply;

constructor (uint256 _initialSupply) public {
    totalSupply = _initialSupply;
    
}
}
