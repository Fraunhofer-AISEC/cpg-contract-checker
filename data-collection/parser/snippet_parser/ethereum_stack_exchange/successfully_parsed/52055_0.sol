pragma solidity ^0.4.23;

contract TestContract {


    bytes32 internal lastHash;

    constructor() {
        lastHash = keccak256(abi.encodePacked(msg.sender, now));
    }

    function getHash() public view returns(bytes32) {
        return lastHash;
    }

    function getHashNum() public view returns(uint256) {
        return uint256(lastHash);
    }
}
