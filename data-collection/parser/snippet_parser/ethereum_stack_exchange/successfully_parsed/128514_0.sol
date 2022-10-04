function uintToHexString(uint i) public pure returns (string memory) {
    if (i == 0) return "0";
    uint j = i;
    uint length;
    while (j != 0) {
        length++;
        j = j >> 4;
    }
    uint mask = 15;
    bytes memory bstr = new bytes(length);
    uint k = length;
    while (i != 0) {
        uint curr = (i & mask);
        bstr[--k] = curr > 9 ?
            bytes1(uint8(55 + curr)) :
            bytes1(uint8(48 + curr)); 
        i = i >> 4;
    }
    return string(bstr);
}
