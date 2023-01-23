function verify(bytes32 testStringBytes, uint8 v, bytes32 r, bytes32 s) constant returns (address) {

bytes memory prefix = "\x19Ethereum Signed Message:\n32";
bytes32 prefixedValue = keccak256(prefix, testStringBytes);
return ecrecover(prefixedValue , v, r, s);
}
