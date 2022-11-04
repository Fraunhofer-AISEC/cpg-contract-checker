pragma solidity ^0.4.0;
contract SimpleStorage {
    object storedData;

    function set(object x) {
        storedData = x;
    }

    function get() constant returns (object) {
        return storedData;
    }
}
