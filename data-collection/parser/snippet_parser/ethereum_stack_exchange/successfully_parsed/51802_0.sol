pragma solidity ^0.6.6;

contract Precision {
    
    uint constant PRECISION = 10 ** 18;
    uint constant demonstrateRatio = 87 * 10 ** 16;
    
    function percentOf(uint baseValue) public pure returns(uint result) {
        return ( baseValue * demonstrateRatio ) / PRECISION;
    }
}

