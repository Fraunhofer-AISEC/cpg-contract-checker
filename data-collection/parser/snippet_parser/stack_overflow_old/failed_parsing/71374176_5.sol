 bytes memory prefix = "\x19Ethereum Signed Message:\n32";
 bytes32 prefixedHashMessage = keccak256(abi.encodePacked(prefix,getMessageHash(msg1,amount,nonce)));
    
 address signer = ecrecover(prefixedHashMessage, _v, _r, _s);
