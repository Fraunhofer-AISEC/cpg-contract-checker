pragma ton-solidity ^0.51.0;

contract Pong {
    function get(uint b) external responsible returns (uint) {
        return b + 1;
    }
}
