  function writeTest2(uint256 key) external {
        MyStruct memory test2 = MyStruct(10, 20); 
        assembly {
            mstore(0x0, key)
            mstore(0x20, myStruct.slot)
            let hash := keccak256(0, 0x40)
            sstore(hash, mload(test2))
            
        }
    }
