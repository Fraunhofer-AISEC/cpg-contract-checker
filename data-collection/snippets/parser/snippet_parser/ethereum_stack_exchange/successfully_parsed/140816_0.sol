

pragma solidity ^0.8.7;

contract Test{

    function Test1() public pure returns (uint256) {
        return (5 / 2) * 10;
    }

    function Test2(uint256 x, uint256 y) public pure returns (uint256) {
        return (x / y) * 10;
    }
}
