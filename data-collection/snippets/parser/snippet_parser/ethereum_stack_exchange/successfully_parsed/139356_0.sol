pragma solidity 0.8.17;

contract Test {
    function add(uint storage a, uint storage b) internal returns (uint) {
        return a + b;
    }
}
