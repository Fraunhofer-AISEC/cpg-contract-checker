pragma solidity ^0.4.19;


contract Bank {
    uint private value;
    address private owner;

    modifier onlyOwner {
        require(owner == msg.sender);
        _;
    }

    function Bank(uint amount) {
        value = amount;
        owner = msg.sender;
    }

    function checkValue(uint amount) returns (bool) {
        return amount >= value;
    }

    function deposit(uint amount) {
        value += amount;
    }

    function withdraw(uint amount) {
        if(checkValue(amount)) {
        value -= amount;
        }
    }

    function balance() returns (uint) {
        return value;
    }
}

contract MyContract is Bank(10) {
}
