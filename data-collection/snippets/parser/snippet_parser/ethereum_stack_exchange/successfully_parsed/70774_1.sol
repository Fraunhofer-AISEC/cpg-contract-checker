pragma solidity 0.5.1;


contract Token {
    uint256 public totalSuply;

    constructor (uint256 _totalSuply) public {
        totalSuply = _totalSuply;
    }
}
