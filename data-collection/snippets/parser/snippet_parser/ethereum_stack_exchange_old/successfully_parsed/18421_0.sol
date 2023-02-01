pragma solidity ^0.4.10;

contract A {

    struct someStruct{
        uint prop1;
        uint prop2;
        address [] users;
    }


    mapping (uint => someStruct) public structList;
    someStruct[] public someStructs;

    function createSomeStruct(uint _prop1, uint _prop2){
        structList[_prop1].prop1 = _prop1;
        structList[_prop1].prop2 = _prop2;
        someStructs.push(structList[_prop1]);
    }

    function addUsers(uint _prop1, address _userAddress){
        structList[_prop1].users.push(_userAddress);
        

    }
}
