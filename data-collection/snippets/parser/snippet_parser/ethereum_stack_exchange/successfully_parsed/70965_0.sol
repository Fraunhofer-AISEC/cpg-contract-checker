pragma solidity ^0.5.0;
contract SampleContract
{
    function fromHexChar(uint c) public pure returns(uint)
    {
        if(byte(c) >= byte('0') && byte(c) <= byte('9')) 
        {
            return c - uint(byte('0'));
        }
        if(byte(c) >= byte('a') && byte(c) <= byte('f'))
        {
            return 10 + c - uint(byte('a'));
        }
        if(byte(c) >= byte('A') && byte(c) <= byte('F'))
        {
            return 10 + c - uint(byte('A'));
        }
    }

    function fromHex(string memory s) public pure returns(bytes) 
    {
        bytes memory ss = bytes(s);
        require(ss.length%2 == 0);

        bytes memory r = new bytes(ss.length/2);
        for(uint i=0; i<ss.length/2; ++i)
        {
            r[i] = byte(fromHexChar(uint(ss[2*i]))*16 +         
            fromHexChar(uint(ss[2*i+1])));
        }
        return r;
    }
}
