
pragma solidity ^0.7.1;

contract TupleTest {
    
    function foo() public pure returns (uint256 left, uint256 middle, uint256 right) {
        return (8, 16, 32);
    }
    
    function bar() external pure returns (uint256) {
        uint256 middle;
        (, middle, ) = foo();
        return middle;
    }
}
