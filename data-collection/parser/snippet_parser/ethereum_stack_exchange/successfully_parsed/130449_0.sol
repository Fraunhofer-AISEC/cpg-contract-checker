 mapping(uint256 => MyStruct) public myStruct;
    struct MyStruct {
        uint128 slot1;
        uint128 slot2; 
    }
    function writeTest(uint256 key) external {
        assembly {
            mstore(0x0, key)
            mstore(0x20, myStruct.slot)
            let hash := keccak256(0, 0x40)
            let s:= sload(hash)
            sstore(
                hash,
                or(
                    and(s, not(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)),
                    and(12, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)
                )
            ) 
            let slot2 := div(
                and(
                    s,
                    0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000
                ),
                0x100000000000000000000000000000000
            ) 
            
            slot2 := shr(128, s)
            
        }
    }
