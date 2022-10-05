function encryptDecrypt (bytes memory data, bytes memory key)
  public pure returns (bytes memory result) {
  
  uint256 length = data.length;

  assembly {
    
    result := mload (0x40)
    
    mstore (0x40, add (add (result, length), 32))
    
    mstore (result, length)
  }

  
  for (uint i = 0; i < length; i += 32) {
    
    bytes32 hash = keccak256 (abi.encodePacked (key, i));

    bytes32 chunk;
    assembly {
      
      chunk := mload (add (data, add (i, 32)))
    }
    
    chunk ^= hash;
    assembly {
      
      mstore (add (result, add (i, 32)), chunk)
    }
  }
}
