address signerPublic = 0x...;

Helper method:
  
  function prefixed(bytes32 hash) internal pure returns (bytes32) {
        return keccak256(abi.encodePacked("\x19Ethereum Signed Message:\n32", hash));
  }

Params:
   string memory tokenURI_;
   bytes memory signature;

In Method Body:
 
   bytes32 hashedURI = keccak256(abi.encodePacked(tokenURI_));   
   bytes32 prefixedHash = prefixed(hashedURI);      
   address signer = prefixedHash.recover(signature);

   if (signer == signerPublic) {...}

