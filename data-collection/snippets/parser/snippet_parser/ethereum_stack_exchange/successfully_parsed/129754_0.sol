pragma solidity ^0.8.0;

contract Demo {
    uint[] public storageDynamicUintArray;

    struct A {
        uint a;
    }
    A[] public storageDynamicArrayOfA;

    function pushToStorageDynamicUintArray() public {
        require(storageDynamicUintArray.length == 0, "storageDynamicUintArray.length == 0");
        
        uint item = storageDynamicUintArray.push(); 
        require(storageDynamicUintArray.length == 1, "storageDynamicUintArray.length == 1");
        item = 1;
        require(item == 1, "item == 1");
        require(storageDynamicUintArray[0] == 0, "storageDynamicUintArray[0] == 0");
    }

    function pushToStorageDynamicArrayOfA() public {
        require(storageDynamicArrayOfA.length == 0, "storageDynamicArrayOfA.length == 0");
        
        A memory memoryItem = storageDynamicArrayOfA.push(); 
        require(storageDynamicArrayOfA.length == 1, "storageDynamicArrayOfA.length == 1");
        memoryItem.a = 1;
        require(memoryItem.a == 1, "memoryItem.a == 1");
        require(storageDynamicArrayOfA[0].a == 0, "storageDynamicArrayOfA[0].a == 0");

        A storage storageItem = storageDynamicArrayOfA.push(); 
        require(storageDynamicArrayOfA.length == 2, "storageDynamicArrayOfA.length == 2");
        storageItem.a = 2;
        require(storageItem.a == 2, "storageItem.a == 2");
        require(storageDynamicArrayOfA[1].a == 2, "storageDynamicArrayOfA[1].a == 2");
    }
}
