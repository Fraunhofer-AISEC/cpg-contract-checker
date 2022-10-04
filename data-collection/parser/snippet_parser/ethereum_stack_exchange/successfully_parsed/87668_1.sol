function fourLeadingZeroBytes(bytes32 b) public pure returns (bool) {
    return b[0] == 0 && b[1] == 0 && b[2] == 0 && b[3] == 0;
}
