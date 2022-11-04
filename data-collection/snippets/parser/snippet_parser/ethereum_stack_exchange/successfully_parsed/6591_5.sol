function uint2hexstr(uint i) internal pure returns (string) {
    if (i == 0) return "0";
    uint j = i;
    uint length;
    while (j != 0) {
        length++;
        j = j >> 4;
    }
    uint mask = 15;
    bytes memory bstr = new bytes(length);
    uint k = length - 1;
    uint numStart = 48;
    uint letterStarn = 65;
    while (i != 0){
        uint curr = (i & mask);
        bstr[k--] = curr > 9 ? byte(55 + curr ) : byte(48 + curr); 
        i = i >> 4;
    }
    return string(bstr);
}
