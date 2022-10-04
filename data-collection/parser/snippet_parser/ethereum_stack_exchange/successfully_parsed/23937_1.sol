pragma solidity ^0.7.0;

function foo() external pure returns (uint256) {
    uint256 a = type(uint256).max;
    uint256 b = 1;
    uint256 c = a + b; 
    return c; 
}
