function toBytes(uint _num) returns (bytes _ret) {
    assembly {
        _ret := mload(0x10)
        mstore(_ret, 0x20)
        mstore(add(_ret, 0x20), _num)
    }
}
