pragma solidity ^0.6.8;

contract TestContract {
    uint256 public a;
    uint256 public b;
    
    function myTest() external {
        a = type(uint256).min;
        b = type(uint256).max;
    }
}
