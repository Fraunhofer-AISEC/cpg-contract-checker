function getFraction(uint percent, uint base) public pure returns(uint portion) {
    uint temp = percent * base * 10 + 5;
    return temp / 10;
}
