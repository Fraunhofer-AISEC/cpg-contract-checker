pragma solidity ^0.8;

contract MyContract {
    function foo(uint256[][] memory _array) external pure returns (uint256[][] memory) {
        return _array;
    }
}
