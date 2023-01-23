function bytes32to2xint128(bytes32 z) pure public returns (int128 x, int128 y){
    bytes16[2] memory tmp = [bytes16(0), 0];
    assembly {
        mstore(tmp, z)
        mstore(add(tmp, 16), z)
    }
    x=int128(tmp[0]);
    y=int128(tmp[1]);
}
