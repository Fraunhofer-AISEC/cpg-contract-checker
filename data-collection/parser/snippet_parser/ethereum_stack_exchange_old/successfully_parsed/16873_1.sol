pragma solidity ^0.4.10;

contract Test {
    function getSha256(uint32 nonce) constant returns (bytes32 hash) {
        return sha256(nonce);
    }
}
