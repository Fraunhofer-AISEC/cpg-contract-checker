bytes memory prefix = "\x19Ethereum Signed Message:\n32";
bytes32 prefixedHash = keccak256(prefix, hash);
return ecrecover(prefixedHash, v, r, s) == (Your Address);
