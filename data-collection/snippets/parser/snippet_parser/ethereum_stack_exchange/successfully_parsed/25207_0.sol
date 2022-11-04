pragma solidity ^0.4.11;

contract NumberTracer {
    bytes32 tracer;
    uint256 seed = 1000;
    uint256 currentSum;

    function NumberTracer(bytes32 t) {
        tracer = t;
    }

    function addNumber(uint256 n) {
        currentSum = seed + n;
    }

    function getCurrentSum() returns (uint256) {
        return currentSum;
    }
}
