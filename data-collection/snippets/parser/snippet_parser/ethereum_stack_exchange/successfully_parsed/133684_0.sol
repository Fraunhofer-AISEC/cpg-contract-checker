function modExp(bytes memory _b, uint _e, bytes memory _m) public returns (bytes memory result) {

     assembly {
        
        let pointer := mload(0x40)

        
        mstore(pointer, 0x1000)
        mstore(add(pointer, 0x20), 0x20)
        mstore(add(pointer, 0x40), 0x1000)

        
        mstore(add(pointer, 0x60), _b)
        mstore(add(pointer, 0x1060), _e) 
        mstore(add(pointer, 0x1080), _m) 

        
        let value := mload(0x2080) 

        
        if iszero(call(not(0), 0x05, 0, pointer, 0xc0, value, 0x20)) {
            revert(0, 0)
        }

        result := mload(value)
    }
}
