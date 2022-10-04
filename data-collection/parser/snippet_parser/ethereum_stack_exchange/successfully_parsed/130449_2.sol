  function testPackingMemory(uint64 a,uint64 b,uint128 c) external {
        assembly {
            mstore(0x40,some_value) 
        }
    }
