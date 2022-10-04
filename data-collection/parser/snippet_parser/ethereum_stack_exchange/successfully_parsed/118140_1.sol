
function getValue(uint four_nibbles, uint mask) public pure returns (bool) {
    return (four_nibbles & mask) > 0;
}
