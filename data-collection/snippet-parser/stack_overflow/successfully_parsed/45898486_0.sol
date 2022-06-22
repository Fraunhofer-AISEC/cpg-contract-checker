pragma solidity ^0.4.4;

contract A {

    address public owner;

    function A() {
         owner = msg.sender;
    }

    function createB(string name) {
        return new B(msg.sender, name);
    }
}
