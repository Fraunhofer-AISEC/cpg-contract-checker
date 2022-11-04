function getUniqueHash(address _hashunique) public view returns (address) 
    {
        bytes20 b = bytes20(keccak256(msg.sender, block.timestamp));
        uint addr = 0;
        for (uint index = b.length-1; index+1 > 0; index--) {
            addr += uint(b[index]) * ( 16 ** ((b.length - index - 1) * 2));
        }
        return address(addr);
    }
