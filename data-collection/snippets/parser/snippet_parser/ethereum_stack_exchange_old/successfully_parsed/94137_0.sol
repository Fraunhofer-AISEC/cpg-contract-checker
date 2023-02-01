
pragma solidity ^0.8.0;

contract MyContract
{
    struct TestVars
    {
        uint8 a;
        uint64 b;
        uint64 c;
    }
    
    TestVars private vals;
    
    constructor()
    {
        vals.a = 5;
        vals.b = 6;
        vals.c = 7;
    }
    
    function readValsStorage()
        external 
    {
        TestVars storage v = vals;
        uint a = v.a;
        uint b = v.b;
        uint c = v.c;
    }
    
    function readValsMemory()
        external 
    {
        TestVars memory v = vals;
        uint a = v.a;
        uint b = v.b;
        uint c = v.c;
    }
}
