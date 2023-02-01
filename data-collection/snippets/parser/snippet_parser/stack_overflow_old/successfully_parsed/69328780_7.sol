   function uint24ToHexStrAlt2(uint24 i) public pure returns (string memory) {
        bytes memory o = new bytes(6);
        uint k = 0;
        do {
            o[k] = bytes1(uint8ToHexCharCode(uint8(i >> 20))); 
            i <<= 4;
            k +=1;
        } while (k < 6);
        return string(o);
    }
