function stringToUint(string s) internal pure returns (uint) {
    bytes memory b = bytes(s);
    uint result = 0;
    for (uint i = 0; i < b.length; i++) { 
        if (b[i] >= 48 && b[i] <= 57) {
            result = result * 10 + (uint(b[i]) - 48);
        }
    }
    return result;
}
