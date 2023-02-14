function debugPrice (uint8 x1, uint8 y1, uint16 numSold) private returns (uint80) {
    return uint80(1 finney * (2 ** (numSold/1000))); 
}
