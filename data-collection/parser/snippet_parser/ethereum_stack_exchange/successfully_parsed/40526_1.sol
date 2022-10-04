pragma solidity ^0.4.20;

contract Test {
    function isNegative(int256 x) public pure returns (bool) {
        return x < 0;
    }
}
