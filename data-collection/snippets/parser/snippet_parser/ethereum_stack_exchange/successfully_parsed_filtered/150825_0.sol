function init(buffer memory buf, uint capacity) internal pure returns(buffer memory) {
    if (capacity % 32 != 0) {
        capacity += 32 - (capacity % 32);
    }
    
    buf.capacity = capacity;
    assembly {
        let ptr := mload(0x40)
        mstore(buf, ptr)
        mstore(ptr, 0)
        let fpm := add(32, add(ptr, capacity))
        if lt(fpm, ptr) {
            revert(0, 0)
        }
        mstore(0x40, fpm)
    }
    return buf;
}
