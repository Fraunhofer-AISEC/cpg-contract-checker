uint[2] testStorage;
    
    function assemblyStorage() public  returns (uint a, uint b){
       testStorage[0] = 5;
       testStorage[1] = 10;
       uint[2] memory testMemory = testStorage;
       assembly {
           a:=mload(0x80)
           b:=mload(add(0x80, 32))
       }
    }
