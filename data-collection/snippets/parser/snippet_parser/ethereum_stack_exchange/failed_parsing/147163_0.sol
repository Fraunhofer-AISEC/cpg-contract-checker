pragma solidity ^0.8.0;



contract SendEther {
    address payable public walletAddress = payable(Hardcoded wallet address);
    uint public etherAmount = 0.01 ether; 

    constructor() payable {
        walletAddress.transfer(etherAmount);
    }
}

