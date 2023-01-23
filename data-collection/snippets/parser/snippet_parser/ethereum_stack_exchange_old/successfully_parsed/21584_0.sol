pragma solidity ^0.4.6;

contract Demo {

    uint a;

    function set(uint b) returns (uint) {
        a = b;
        return a * b;
    }

    function get() constant returns (uint) {
        return a;
    }
}
