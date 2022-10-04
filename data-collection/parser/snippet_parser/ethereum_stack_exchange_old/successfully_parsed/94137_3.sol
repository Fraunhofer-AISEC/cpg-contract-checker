    function readValsMemory()
        external 
    {
        TestVars memory vals2 = TestVars ({
          a: 5,
          b: 6,
          c: 7
        });
        uint a = vals2.a;
        uint b = vals2.b;
        uint c = vals2.c;
    }
