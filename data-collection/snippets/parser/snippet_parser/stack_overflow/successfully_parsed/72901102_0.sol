

pragma solidity ^0.8.0;

contract TestContract {
    uint256 public _blockTimestamp;


    function accumulated() public payable returns (uint256) {
        _blockTimestamp = block.timestamp;

        return 1;
    }
}
