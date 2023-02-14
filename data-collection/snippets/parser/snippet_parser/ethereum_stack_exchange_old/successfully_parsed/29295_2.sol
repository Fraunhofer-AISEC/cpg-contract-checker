function bytesToString(bytes memory byteCode) public pure returns(string memory stringData)
{
    uint256 blank = 0; 
    uint256 length = byteCode.length;

    uint cycles = byteCode.length / 0x20;
    uint requiredAlloc = length;

    if (length % 0x20 > 0) 
    {
        cycles++;
        requiredAlloc += 0x20; 
    }

    stringData = new string(requiredAlloc);

    
    assembly {
        let cycle := 0

        for
        {
            let mc := add(stringData, 0x20) 
            let cc := add(byteCode, 0x20)   
        } lt(cycle, cycles) {
            mc := add(mc, 0x20)
            cc := add(cc, 0x20)
            cycle := add(cycle, 0x01)
        } {
            mstore(mc, mload(cc))
        }
    }

    
    if (length % 0x20 > 0)
    {
        uint offsetStart = 0x20 + length;
        assembly
        {
            let mc := add(stringData, offsetStart)
            mstore(mc, mload(add(blank, 0x20)))
            
            mstore(stringData, length)
        }
    }
}
