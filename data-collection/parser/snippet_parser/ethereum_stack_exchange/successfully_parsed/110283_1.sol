    function test(uint32 first) public pure returns (uint128) {
        uint32 second = 1049;
        uint64 third = 1632141235;
        
        return uint128(first) | uint128(second) << 32 | uint128(third) << 64;
    }
