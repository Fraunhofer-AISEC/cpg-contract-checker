pragma solidity ^0.4.11;

contract Bytes32Test {
    bytes32[] public fooStore;

    function getFooStoreLength() constant returns (uint len) {
        return fooStore.length;
    }

    event logFoo(bytes32 foo);
    function sendFoo(bytes32 foo) {
        fooStore.push(foo);
        logFoo(foo);
    }

}
