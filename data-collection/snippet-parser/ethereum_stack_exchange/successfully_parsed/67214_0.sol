pragma solidity 0.4.24;

contract HelloWorld {
    uint public balance;

    constructor() public {
        balance = 1000;
    }

    function deposit(uint _value) constant public returns (uint _newValue) {
        balance += _value;
        return balance;
    }

    function get() constant public returns (uint) {
        return balance;
    }
}
