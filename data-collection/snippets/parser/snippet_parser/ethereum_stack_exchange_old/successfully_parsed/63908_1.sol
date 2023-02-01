pragma solidity ^0.5.1;



contract AddressChecksumUtils {
  
  function getChecksum(
    address account
  ) external pure returns (string memory accountChecksum) {
    
    return _toChecksumString(account);
  }

  
  function getChecksumCapitalizedCharacters(
    address account
  ) external pure returns (bool[40] memory characterCapitalized) {
    
    return _toChecksumCapsFlags(account);
  }

  
  function isChecksumValid(
    string calldata accountChecksum
  ) external pure returns (bool ok) {
    
    return _isChecksumValid(accountChecksum);
  }

  function _toChecksumString(
    address account
  ) internal pure returns (string memory asciiString) {
    
    bytes20 data = bytes20(account);

    
    bytes memory asciiBytes = new bytes(40);

    
    uint8 b;
    uint8 leftNibble;
    uint8 rightNibble;
    bool leftCaps;
    bool rightCaps;
    uint8 asciiOffset;

    
    bool[40] memory caps = _toChecksumCapsFlags(account);

    
    for (uint256 i = 0; i < data.length; i++) {
      
      b = uint8(uint160(data) / (2**(8*(19 - i))));
      leftNibble = b / 16;
      rightNibble = b - 16 * leftNibble;

      
      leftCaps = caps[2*i];
      rightCaps = caps[2*i + 1];

      
      asciiOffset = _getAsciiOffset(leftNibble, leftCaps);

      
      asciiBytes[2 * i] = byte(leftNibble + asciiOffset);

      
      asciiOffset = _getAsciiOffset(rightNibble, rightCaps);

      
      asciiBytes[2 * i + 1] = byte(rightNibble + asciiOffset);
    }

    return string(asciiBytes);
  }

  function _toChecksumCapsFlags(address account) internal pure returns (
    bool[40] memory characterCapitalized
  ) {
    
    bytes20 a = bytes20(account);

    
    bytes32 b = keccak256(abi.encodePacked(_toAsciiString(a)));

    
    uint8 leftNibbleAddress;
    uint8 rightNibbleAddress;
    uint8 leftNibbleHash;
    uint8 rightNibbleHash;

    
    for (uint256 i; i < a.length; i++) {
      
      rightNibbleAddress = uint8(a[i]) % 16;
      leftNibbleAddress = (uint8(a[i]) - rightNibbleAddress) / 16;
      rightNibbleHash = uint8(b[i]) % 16;
      leftNibbleHash = (uint8(b[i]) - rightNibbleHash) / 16;

      characterCapitalized[2 * i] = (
        leftNibbleAddress > 9 &&
        leftNibbleHash > 7
      );
      characterCapitalized[2 * i + 1] = (
        rightNibbleAddress > 9 &&
        rightNibbleHash > 7
      );
    }
  }

  function _isChecksumValid(
    string memory provided
  ) internal pure returns (bool ok) {
    
    address account = _toAddress(provided);

    
    if (
      account == address(0)
    ) {
      
      bytes memory b = bytes(provided);
      for (uint256 i; i < b.length; i++) {
        if (b[i] != hex"30") {
          return false;
        }
      }
    }

    
    string memory actual = _toChecksumString(account);

    
    return (
      keccak256(
        abi.encodePacked(
          actual
        )
      ) == keccak256(
        abi.encodePacked(
          provided
        )
      )
    );
  }

  function _getAsciiOffset(
    uint8 nibble, bool caps
  ) internal pure returns (uint8 offset) {
    
    if (nibble < 10) {
      offset = 48;
    } else if (caps) {
      offset = 55;
    } else {
      offset = 87;
    }
  }

  function _toAddress(
    string memory account
  ) internal pure returns (address accountAddress) {
    
    bytes memory accountBytes = bytes(account);

    
    bytes memory accountAddressBytes = new bytes(20);

    
    uint8 b;
    uint8 nibble;
    uint8 asciiOffset;

    
    if (accountBytes.length == 40) {
      for (uint256 i; i < 40; i++) {
        
        b = uint8(accountBytes[i]);

        
        if (b < 48) return address(0);
        if (57 < b && b < 65) return address(0);
        if (70 < b && b < 97) return address(0);
        if (102 < b) return address(0); 

        
        if (b < 65) { 
          asciiOffset = 48;
        } else if (70 < b) { 
          asciiOffset = 87;
        } else { 
          asciiOffset = 55;
        }

        
        if (i % 2 == 0) {
          nibble = b - asciiOffset;
        } else {
          accountAddressBytes[(i - 1) / 2] = (
            byte(16 * nibble + (b - asciiOffset)));
        }
      }

      
      bytes memory packed = abi.encodePacked(accountAddressBytes);
      assembly {
        accountAddress := mload(add(packed, 20))
      }
    }
  }

  
  function _toAsciiString(
    bytes20 data
  ) internal pure returns (string memory asciiString) {
    
    bytes memory asciiBytes = new bytes(40);

    
    uint8 b;
    uint8 leftNibble;
    uint8 rightNibble;

    
    for (uint256 i = 0; i < data.length; i++) {
      
      b = uint8(uint160(data) / (2 ** (8 * (19 - i))));
      leftNibble = b / 16;
      rightNibble = b - 16 * leftNibble;

      
      asciiBytes[2 * i] = byte(leftNibble + (leftNibble < 10 ? 48 : 87));
      asciiBytes[2 * i + 1] = byte(rightNibble + (rightNibble < 10 ? 48 : 87));
    }

    return string(asciiBytes);
  }
}
