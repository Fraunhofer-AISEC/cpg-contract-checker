  function scopingExample(
                          uint intVar1,
                          address[] calldata arr1,
                          address[] calldata arr2,
                          address[] calldata arr3,
                          address[] calldata arr4,
                          ) external {

    
    address addr1 = arr1[1];
    address addr2 = arr1[2];
    address addr3 = arr1[3];
    address addr4 = arr1[4];
    
    {
    
    
    address scopeVar = arr1[5];
    
    functionCallToWriteBlockchain(addr1,arr2[0],arr2[1],arr2[2],scopeVar,amount);
    functionCallToWriteBlockchain(addr2,arr3[0],arr3[1],arr3[2],scopeVar,amount);
    functionCallToWriteBlockchain(addr3,arr4[0],arr4[1],arr4[2],scopeVar,amount);
    }

    otherCallWhichWritesBlockchain(addr1,addr2,addr3,addr4);

  }
