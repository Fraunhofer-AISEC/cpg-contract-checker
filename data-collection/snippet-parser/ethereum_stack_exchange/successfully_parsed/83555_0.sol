pragma solidity ^0.5.11;

contract ReceiveEther {
    uint256 public clicksfromcreatorcount; 
    uint256 public count;
    address public creatorino = tx.origin;
}