function int128x2tobytes32(int128 x, int128 y) pure public returns (bytes32){
    bytes32 c = bytes16(x);
    bytes32 d = bytes16(y);
    return (c>> 128) | d; 
}
