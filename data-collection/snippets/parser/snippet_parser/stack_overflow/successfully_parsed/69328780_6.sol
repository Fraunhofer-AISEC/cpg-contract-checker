    function uint24ToHexStr(uint24 i) public pure returns (string memory) {
        bytes memory o = new bytes(6);
        uint24 mask = 0x00000f; 
        uint k = 6;
        do {
            k--;
            o[k] = bytes1(uint8ToHexCharCode(uint8(i & mask)));
            i >>= 4;
        } while (k > 0);
        return string(o);
    }
