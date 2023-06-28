function createMemoryArray(uint size) returns (bytes) {
    
    uint[2][] memory arrayOfPairs = new uint[2][](size);
    
    bytes memory b = new bytes(200);
    for (uint i = 0; i < b.length; i++)
        b[i] = byte(i);
    return b;
}
