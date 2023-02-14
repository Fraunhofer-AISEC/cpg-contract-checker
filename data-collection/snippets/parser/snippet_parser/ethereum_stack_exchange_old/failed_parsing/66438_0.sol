function uint2str(uint i) internal pure returns (string memory) {
    if (i == 0) return "0";
    uint j = i;
    uint length;
    while (j != 0) {
        length++;
        j /= 10;
    }
    bytes memory bstr = new bytes(length);
    uint k = length - 1;
    while (i != 0) {
        bstr[k--] = byte(48 + i % 10);   ----> this is the place I get error
        i /= 10;
    }
    return string(bstr);
}
