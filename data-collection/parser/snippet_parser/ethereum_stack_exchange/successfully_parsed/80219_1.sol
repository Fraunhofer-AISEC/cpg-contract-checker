pragma solidity ^0.6.3;

contract Test {
    function getHash(bytes32 challenge, address adr, uint256 nonce) external pure returns (bytes32) {
        return keccak256(abi.encodePacked(challenge, adr, nonce));
    }
}
