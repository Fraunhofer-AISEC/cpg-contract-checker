function shift(int val) returns(int) {
    int res;
    assembly {
        let m := mload(0x40)
        mstore(m, shl(2, val))
        mstore(0x40, add(m, 0x20))
        res := mload(m)
    }

    return res;
}
