
pragma solidity ^0.7.0;

contract CreateWallet {
    Wallet[] private wallets;
    mapping(address => bool) private walletRight; 

    
    function createWallet() public {
        require(!walletRight[msg.sender]);
        Wallet wallet = new Wallet(msg.sender);
        wallets.push(wallet);
        walletRight[msg.sender] = true;
    }

}

contract Wallet  {
    address public owner;
    address public walletAddr;

    
    constructor(address _owner) {
        owner = _owner;
        walletAddr = address(this);
    }
}
