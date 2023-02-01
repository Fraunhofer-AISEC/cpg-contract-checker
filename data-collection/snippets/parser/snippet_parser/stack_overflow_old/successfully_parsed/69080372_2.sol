pragma solidity ^0.8;

contract MyContract {
    int8 public a; 
    int8 public b = -2;
    
    function foo() external pure returns (int256) {
        int256 negative = -100;
        return negative;
    }
}
