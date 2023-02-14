
 
  function calculateAddressHash(address a) public pure returns (bytes32 hash, bytes memory data) {

    
    
    
    bytes memory packed = abi.encodePacked(a);

    
    bytes32 hashResult = keccak256(packed);

    return(hashResult, packed);
  }


