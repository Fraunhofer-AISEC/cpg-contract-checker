function bytes32ToLiteralString(bytes32 data) 
    public
    pure
    returns (string memory result) 
{
    bytes memory temp = new bytes(65);
    uint256 count;

    for (uint256 i = 0; i < 32; i++) {
        bytes1 currentByte = bytes1(data << (i * 8));
        
        uint8 c1 = uint8(
            bytes1((currentByte << 4) >> 4)
        );
        
        uint8 c2 = uint8(
            bytes1((currentByte >> 4))
        );
    
        if (c2 >= 0 && c2 <= 9) temp[++count] = bytes1(c2 + 48);
        else temp[++count] = bytes1(c2 + 87);
        
        if (c1 >= 0 && c1 <= 9) temp[++count] = bytes1(c1 + 48);
        else temp[++count] = bytes1(c1 + 87);
    }
    
    result = string(temp);
}
