    
    function checkSignature(bytes32 h, uint8 v, bytes32 r, bytes32 s) public pure returns (address signer) {
        bytes memory prefix = "\x19Ethereum Signed Message:\n32";    
        bytes32 prefixedHash = keccak256(abi.encodePacked(prefix,h));  
        signer = ecrecover(prefixedHash, v, r, s); 
    }
