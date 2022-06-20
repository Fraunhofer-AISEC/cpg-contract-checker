pragma solidity ^0.4.4;

contract HelloWorld {
    uint public balance;

    function sayHi() returns (bool success) {
        balance = 1000;
        return true;
    }
}
