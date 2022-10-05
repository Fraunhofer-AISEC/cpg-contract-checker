pragma solidity ^0.4.18;

contract ZeroDelegate {
    function baz(uint x) public returns (uint) {
        return x * 0;
    }
}
