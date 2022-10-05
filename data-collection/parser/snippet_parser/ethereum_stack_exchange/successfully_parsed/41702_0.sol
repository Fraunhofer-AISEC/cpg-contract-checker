pragma solidity ^0.4.18;


contract DBKeys {

    struct keyStruct {
        bool keyStatus; 
    }
    mapping(bytes32=>keyStruct) public zkeys;
    function addZkey( bytes32 newkey) public returns (bool) {
    if (zkeys[newkey].keyStatus) {
        return false; 
        }
        zkeys[newkey].keyStatus=true;
        return true;    
    }
    function delZkey(bytes32 newkey) public returns (bool) {
        if (zkeys[newkey].keyStatus) {
            delete zkeys[newkey];
            return true;
        }
        return false;
    }
}
