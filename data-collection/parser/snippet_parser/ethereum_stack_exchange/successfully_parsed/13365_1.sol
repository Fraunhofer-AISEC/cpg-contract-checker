pragma solidity ^0.4.0;
contract TestcaseResetObject {

    uint public objectCount;

    struct MyObjectStruct {
        mapping(uint => uint) map;
    }

    MyObjectStruct[] myObjects;

    event LogOutput(uint number);

    function makeNewObject() public returns(uint count) {

        MyObjectStruct memory mo;
        objectCount = myObjects.push(mo);
        return objectCount;
    }

    
    function incCounter(uint objectNumber, uint index) public returns(uint newValue) {
        myObjects[objectNumber].map[index] += 1;
        LogOutput(myObjects[objectNumber].map[index]);
        return myObjects[objectNumber].map[index];
    }
}
