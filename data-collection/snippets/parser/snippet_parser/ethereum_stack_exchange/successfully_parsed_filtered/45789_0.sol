function isSigned(address _addr, bytes32 msgHash, uint8 v, bytes32 r,  bytes32 s) public constant returns (bool) {

         bytes memory prefix = "\x19Ethereum Signed Message:\n32";
         bytes32 prefixedHash = sha3(prefix, msgHash);
         return ecrecover(prefixedHash, v, r, s) == _addr;
    }
