

pragma solidity ^0.8.0;


import "../token/ContractA.sol";

contract ContractB{

    ContractA public A = new ContractA("Test Token", "TEST", address(this));
    uint256 public totalStakes;
    constructor() {}

    receive() external payable {
       
    }
}

