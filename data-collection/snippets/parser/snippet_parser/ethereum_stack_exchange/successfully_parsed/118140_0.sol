
function getValue(uint four_nibbles, uint mask) public pure returns (uint) {
    return (four_nibbles & mask) > 0 ? 1 : 0;
}
