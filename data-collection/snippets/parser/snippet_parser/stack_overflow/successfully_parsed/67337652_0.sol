pragma solidity >=0.4.22 <0.9.0;

contract Token {
    uint256 public totalSupply;

    constructor(uint _initialSupply) public {
        totalSupply = _initialSupply;
    }
}
