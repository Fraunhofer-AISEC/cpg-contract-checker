 function testPackingMemory(uint64 a,uint64 b,uint128 c) external pure returns (bytes32 value) {
        assembly {
            
            
            
            
            value := or(value, a)
            value := or(value, shl(64, b))
            value := or(value, shl(128, c))
        }
    }
