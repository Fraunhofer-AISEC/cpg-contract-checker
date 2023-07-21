    function packExample() public pure returns (uint packed) {
        uint value1 = 1; 
        uint value2 = 2; 
        uint value3 = 3; 
        uint value4 = 4; 

        packed = value1;
        packed |= value2 << 64;
        packed |= value3 << 128;
        packed |= value4 << 136;


    }

    function unPackExample(uint packed) public pure returns (uint value1, uint value2, uint value3, uint value4) {
        value1 = uint(uint64(packed));
        value2 = uint(uint64(packed >> 64));
        value3 = uint(uint8(packed >> 128));
        value4 = uint(uint120(packed >> 136));
    }
