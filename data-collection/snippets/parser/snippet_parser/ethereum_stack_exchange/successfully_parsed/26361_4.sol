 pragma solidity ^0.4.0;
  contract SimpleStorage {
    struct Obj{
        int info;
        uint[2] exDataArr;
        bytes32[2] exDataStr;
    }
    mapping(int =>Obj) Obj;
    function set(uint x,uint[2] exDataArr,bytes32[2] exDataStr) {
        Obj[x]= Obj({info:info,exDataArr:exDataArr,exDataStr:exDataStr});
 }   }