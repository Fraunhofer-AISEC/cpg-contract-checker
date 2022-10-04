function isBitSet(bytes24 b, uint pos) returns (bool){
    return (b & (1 << pos)) != 0;
}
