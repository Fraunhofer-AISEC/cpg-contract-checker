pragma solidity ^0.4.24;

contract TestA {
    uint public someValue;

    function setValue(uint a) public {
        someValue = a;
    }
}
