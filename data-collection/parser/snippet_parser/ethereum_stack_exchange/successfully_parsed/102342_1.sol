function hexToByte(string memory s) public pure returns (bytes memory) {
    bytes memory b = bytes(s);
    
    require(b.length%2 == 0, "Invalid length of key string");
    bytes memory ret = new bytes(b.length/2);
    
    for (uint i=0; i<b.length/2; ++i) {
        ret[i] = bytes1(hexCharToByte(uint8(b[2 * i])) * 16 + hexCharToByte(uint8(b[2 * i+1])));
    }
        
    return ret;
}
    
function hexCharToByte(uint8 c) public pure returns (uint8) {
    if(bytes1(c) >= bytes1('0') && bytes1(c) <= bytes1('9'))
        return c - uint8(bytes1('0'));
    if(bytes1(c) >= bytes1('a') && bytes1(c) <= bytes1('f'))
        return 10 + c - uint8(bytes1('a'));
    if(bytes1(c) >= bytes1('A') && bytes1(c) <= bytes1('F'))
        return 10 + c - uint8(bytes1('A'));
    else
        revert("Invalid character in key string");
}
