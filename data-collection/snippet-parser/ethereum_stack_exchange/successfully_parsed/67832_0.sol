pragma solidity 0.5.1;

contract StuctsGetter {

    struct MyStruct {
        uint a;
        bytes32 b;
        mapping(address => bool) active;
        bytes32[] keys;
    }

    mapping(uint => MyStruct) public myStructs;

    function setMyStruct(uint index, uint a, bytes32 b) public {
        MyStruct storage m = myStructs[index];
        m.a = a;
        m.b = b;
    }

}
