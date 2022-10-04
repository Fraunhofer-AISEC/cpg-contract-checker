
pragma solidity ^0.8.10;

contract Structs {

    struct MyStruct {
        bool isTrue;
        uint16 twoBytes;
    }

    MyStruct myStruct;

    constructor() {
        myStruct = MyStruct(true, 10);
    }

    
    function assignAllViaStruct() external view {

        MyStruct memory _myStruct = myStruct;
        _myStruct = MyStruct(true, 100);
    }

    
    function assignAllViaFields() external view {
        MyStruct memory _myStruct = myStruct;
        _myStruct.isTrue = true;
        _myStruct.twoBytes = 100;
    }

    
    function assignSelectViaStruct() external view {
        MyStruct memory _myStruct = myStruct;
        _myStruct = MyStruct(_myStruct.isTrue, 100);
    }

    
    function assignSelectViaFields() external view {
        MyStruct memory _myStruct = myStruct;
        _myStruct.twoBytes = 100;
    }    
}
