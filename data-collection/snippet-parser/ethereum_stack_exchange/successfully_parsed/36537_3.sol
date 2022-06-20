function splitAtTwoDigits(uint num) public pure returns (uint[4] res) {
    res[0] = (b % 100);
    res[1] = ((b / 100) % 100);
    res[2] = ((b / 10000) % 100);
    res[3] = ((b / 1000000) % 100);
}
