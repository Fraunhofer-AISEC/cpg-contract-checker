pragma solidity ^0.4.11;

contract Simple {
    bytes32 public v;
    function set(bytes32 _v) {
        v = _v;
    }
}
