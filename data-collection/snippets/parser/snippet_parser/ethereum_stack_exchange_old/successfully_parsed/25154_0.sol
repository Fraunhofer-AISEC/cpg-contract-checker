pragma solidity ^0.4.4;

contract A {

    function A() {
    }

    function createB(string name) {
        return new B(msg.sender, name);
    }
}
