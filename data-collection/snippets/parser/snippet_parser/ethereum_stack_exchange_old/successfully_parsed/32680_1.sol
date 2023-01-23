function int2str(int i) internal pure returns (string){
    if (i == 0) return "0";
    bool negative = i < 0;
    uint j = uint(negative ? -i : i);
    uint l = j;     
    uint len;
    while (j != 0){
        len++;
        j /= 10;
    }
    if (negative) ++len;  
    bytes memory bstr = new bytes(len);
    uint k = len - 1;
    while (l != 0){
        bstr[k--] = byte(48 + l % 10);
        l /= 10;
    }
    if (negative) {    
        bstr[0] = '-';
    }
    return string(bstr);
}
