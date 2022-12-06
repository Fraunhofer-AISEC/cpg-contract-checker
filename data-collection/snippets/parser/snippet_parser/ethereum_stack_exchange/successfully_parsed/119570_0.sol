
pragma solidity ^0.8.7;

contract ThrowsError {

    uint256 private blockNumber;

    constructor () {
        blockNumber = block.number;
    }

    function viewFunction() public view returns (uint256) {
        return blockNumber - block.number;
    }
}
