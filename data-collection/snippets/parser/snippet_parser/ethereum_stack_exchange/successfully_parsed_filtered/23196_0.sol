pragma solidity ^0.4.11;

contract HelloSystem {

    address owner;

    function HelloSystem() {
        owner = msg.sender;
    }

    function remove() {
        if (msg.sender == owner) {
            selfdestruct(owner);
        }
    }
}
