function substring(string str, uint startIndex, uint endIndex) internal pure returns (string) {
    bytes memory strBytes = bytes(str);
    bytes memory cutted = new bytes(endIndex-startIndex);
    for(uint i = startIndex; i < endIndex; i++) {
        cutted[i-startIndex] = strBytes[i];
    }
    return string(cutted);
}
