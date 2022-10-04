function int128x2tobytes32(int128 x, int128 y) pure public returns (bytes32 z){
    assembly {
        mstore(z, x)
        mstore(add(z, 16), y)
    }
}
