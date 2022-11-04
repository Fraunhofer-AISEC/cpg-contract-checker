pragma solidity ^0.4.0;

contract PushStruct {

    struct MyStruct {
        uint field1;
        uint field2;
    }

    MyStruct[] public myStructs;

    function pushStruct() 
        public
        returns(uint arrayLength) 
    {
        MyStruct memory m;
        m.field1 = 1;
        m.field2 = 2;
        myStructs.push(m);
        return myStructs.length;
    }
}
