function isBitSet(bytes24 b, uint pos) internal view returns (bool){
    return (  bytes32(b) & bytes32(1 << (pos+64)) ) != 0;
}
