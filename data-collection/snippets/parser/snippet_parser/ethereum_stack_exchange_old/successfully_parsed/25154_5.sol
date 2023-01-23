pragma solidity ^0.4.13;

import "./B.sol";

contract A {
    address public owner;
    function A() {
        owner = msg.sender;
    }

    function createB(string name) public returns (address) {
        return new B(owner, name);
    }
}
