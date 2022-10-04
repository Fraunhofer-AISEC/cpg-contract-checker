contract Foobar {
    function checkSignature(bytes32 digest, uint8 v, bytes32 r, byres32 s) constant returns (address signer) {
        return ecrecover(digest, v, r, s);
    }
}
