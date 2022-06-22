pragma solidity ^0.4.0;

contract Example {

    mapping(uint => string) documents;


    function storeDocument(uint id, string docHash) {

        storeDocument[id] = docHash;
    }

    function verifyDocument(uint id, string hashToVerify) returns (bool){
        if(storeDocument[id] == hashToVerify ) {
            return true;
        }
        else{
            return false;
        }
     }
} 
