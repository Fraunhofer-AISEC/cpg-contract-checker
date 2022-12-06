pragma solidity ^0.4.17;
pragma experimental ABIEncoderV2;
contract StructTest{
    struct someTestStruct {
        uint A;
        uint B;
        bytes32 C;
    }
    someTestStruct str;
    function StructTest(){
        str = someTestStruct({A: 5, B: 6, C: "Hi"});
    }
    
    function returnStruct() returns (someTestStruct){
        return str;
    }
}
