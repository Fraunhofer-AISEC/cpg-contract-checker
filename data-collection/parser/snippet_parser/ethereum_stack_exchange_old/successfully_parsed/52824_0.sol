pragma solidity ^0.4.24;

contract Test {
    bytes32 public hash;

    function set(bytes32 h) public {
        hash = h;
    }
}
