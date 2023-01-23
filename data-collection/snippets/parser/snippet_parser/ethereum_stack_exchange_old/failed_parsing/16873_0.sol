function getSha256(uint32 nonce) returns (bytes32 hash) {
    return sha256(nonce);
}

> contractInstance.getSha256.call(1);
Error: Error: VM Exception while executing eth_call: stack underflow
