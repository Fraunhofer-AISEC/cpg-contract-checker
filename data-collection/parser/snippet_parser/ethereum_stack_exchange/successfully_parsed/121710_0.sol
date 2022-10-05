pragma solidity ^0.8.0;

contract foo {

struct Test {
    uint myUint;
    string myString;
}

mapping(uint => Test) public myMapping;

function setMapping(uint key, uint _myUint, string memory _myString) public {
    Test memory test;
    test.myUint = _myUint;
    test.myString = _myString;
    myMapping[key] = test;
}

function nullifyStruct(uint key) public {
    Test memory test;
    myMapping[key] = test;
}


}
