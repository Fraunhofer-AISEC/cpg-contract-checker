function toString(bytes32 source)
    internal
    pure
    returns (string memory result)
{
    uint8 length = 0;
    while (source[length] != 0 && length < 32) {
        length++;
    }
    assembly {
        result := mload(0x40)
        
        mstore(0x40, add(result, 0x40))
        
        mstore(result, length)
        
        mstore(add(result, 0x20), source)
    }
}
