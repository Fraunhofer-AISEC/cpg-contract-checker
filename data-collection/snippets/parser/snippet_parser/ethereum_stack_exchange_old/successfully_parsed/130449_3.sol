function writeTest(uint256 key) external {
        assembly {
            mstore(0x0, key)
            mstore(0x20, myStruct.slot)
            let hash := keccak256(0, 0x40)
            let s:= sload(hash)

            
            
            s := and(s, not(0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))

            
            s := or(s, and(12, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF))

            
            s:= and(s, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)

            
            s := or(s, shl(128, and(24, 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF)))

            sstore(hash, s)
        }
    }
