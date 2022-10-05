pragma solidity ^0.4.24;

contract MyStuff {

    function safeFunc() public pure returns (uint256) {
        uint256 a = 5;
        uint256 b = 6;
        return a + b;
    }

    function unsafeFunc(uint256 a) public pure returns (uint256) {
        uint256 b = 6;
        return a + b;
    }
}
