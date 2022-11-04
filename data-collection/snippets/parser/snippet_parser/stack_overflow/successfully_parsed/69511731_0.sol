function decode(bytes32 x) internal pure returns (uint64 a, uint64 b, uint64 c, uint64 d) {
    assembly {
        d := x
        mstore(0x18, x)
        a := mload(0)
        mstore(0x10, x)
        b := mload(0)
        mstore(0x8, x)
        c := mload(0)
    }
}
