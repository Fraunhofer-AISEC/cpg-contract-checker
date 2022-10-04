pragma solidity ^0.7.0;

contract ErrorExample {
    function foo(uint256 a, uint256 b) external view returns (uint256) {
        unchecked {
            return a + b;
        }
    }
}
