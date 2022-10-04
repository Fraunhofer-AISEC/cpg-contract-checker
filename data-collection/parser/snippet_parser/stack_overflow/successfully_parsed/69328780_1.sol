function uint24ToHexStr(uint24 i) public pure returns (string memory) {
        bytes memory o = new bytes(6);
        uint24 mask = 0x00000f; 
        for(uint k = 5; k >= 0; k -= 1) {
          o[k] = bytes1(uint8ToHexCharCode(uint8(i & mask)));
          i >>= 4;
        }
        return string(o);
    }
