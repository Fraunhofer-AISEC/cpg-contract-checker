pragma solidity ^0.4.24;

contract Test {

    function checkIntegerETH(uint a) public pure returns (bool) {
        return (a % 1 ether == 0);
    }
}
