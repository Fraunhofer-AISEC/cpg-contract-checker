contract Verifier {
  
  function verifyString(string message, uint8 v, bytes32 r,
              bytes32 s) public pure returns (address signer) {
    
    string memory header = "\x19Ethereum Signed Message:\n000000";
    uint256 lengthOffset;
    uint256 length;
    assembly {
      
      length := mload(message)
      
      lengthOffset := add(header, 57)
    }
    
    require(length <= 999999);
    
    uint256 lengthLength = 0;
    
    uint256 divisor = 100000;
    
    while (divisor != 0) {
      
      uint256 digit = length / divisor;
      if (digit == 0) {
        
        if (lengthLength == 0) {
          divisor /= 10;
          continue;
        }
      }
      
      lengthLength++;
      
      length -= digit * divisor;
      
      divisor /= 10;

      
      digit += 0x30;
      
      lengthOffset++;
      assembly {
        mstore8(lengthOffset, digit)
      }
    }
    
    if (lengthLength == 0) {
      lengthLength = 1 + 0x19 + 1;
    } else {
      lengthLength += 1 + 0x19;
    }
    
    assembly {
      mstore(header, lengthLength)
    }
    
    bytes32 check = keccak256(header, message);
    return ecrecover(check, v, r, s);
  }
}
