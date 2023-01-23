pragma solidity ^0.4.18;

contract Foo {
    uint storageData;

    function set(uint x) public {
        storageData = x;
    }

    function get() constant public returns (uint) {
        return storageData;
    }
}
