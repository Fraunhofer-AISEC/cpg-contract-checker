pragma solidity ^0.4.0;

contract BasicToken {
    
    address public owner;

    
    mapping(address => uint) userAccount;


    constructor() public {
        owner = msg.sender;
    }

    
    event increaseToken(address sender, address receiver, uint amount);

    function getBalance(address addr) public view returns (uint) {
        return userAccount[addr];
    }

    function myBalance() public view returns (uint) {
        return userAccount[msg.sender];
    }

    function giveToken(address dest, uint amount) public returns (bool) {
        emit increaseToken(msg.sender, dest, amount);

        userAccount[dest] += amount;

        return true;
    }

}
