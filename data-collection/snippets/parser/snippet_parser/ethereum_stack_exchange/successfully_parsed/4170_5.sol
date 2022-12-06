function toByte(uint8 _num) returns (byte _ret) {
    assembly {
        mstore8(0x20, _num)
        _ret := mload(0x20)
    }
}
