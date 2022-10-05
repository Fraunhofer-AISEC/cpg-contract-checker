function debugPower (uint16 numSold) public constant returns (uint) {
    return uint(2 ** (numSold/1000));
}
