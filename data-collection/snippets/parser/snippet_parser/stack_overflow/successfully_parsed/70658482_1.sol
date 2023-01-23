
pragma solidity ^0.8.0;

interface randomness_interface {
    function fulfillRandomness(uint256 randomness) external view returns (uint);
    function getRandomNumber(bytes32 requestId) external;
}

