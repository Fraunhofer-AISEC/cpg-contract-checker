function writeTest2(uint256 key) external {
        MyStruct memory test2 = MyStruct(10, 20); 

        assembly {
            mstore(0x0, key)
            mstore(0x20, myStruct.slot)
            let hash := keccak256(0, 0x40)

            
            
            

            
            let memory_slot1 := mload(test2)

            
            let memory_slot2 := shl(128, mload(add(test2, 0x20)))

            
            
            
            
            
            let combined := or(memory_slot1, memory_slot2)

            
            sstore(hash, combined)
        }
    }
