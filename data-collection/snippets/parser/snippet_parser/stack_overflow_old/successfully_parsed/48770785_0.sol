function swapBits(uint256 _source) pure public returns (uint256) {
    
    uint16 bits1 = uint16(_source & 0x1F) << 5;

    
    uint16 bits2 = uint16(_source >> 5) & 0x1F;

    return _source & 0xFFFFFFFFFFFFFFFFFFFFFFFFFFFFFC00 | bits1 | bits2;
}
