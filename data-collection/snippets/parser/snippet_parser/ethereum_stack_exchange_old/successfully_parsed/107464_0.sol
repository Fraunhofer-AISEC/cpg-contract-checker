
pragma solidity 0.8.7;

contract Test {
    
    function f1(uint256 a, uint256 b) external pure returns(uint256) {
        uint256 sum = a + b;
        return sum;
    }
    
    function f2(uint256 a, uint256 b) external pure returns(uint256) {
        return a + b;
    }
    
    function f3(uint256 a, uint256 b) external pure returns(uint256 sum) {
        sum = a + b;
    }
}
