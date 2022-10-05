function getValue(uint16 four_nibbles, uint16 index) public pure returns(uint16) {
    return (four_nibbles << (15 - index)) >> 15;
}     
