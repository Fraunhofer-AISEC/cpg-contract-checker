pragma solidity ^0.4.11;
contract TestArray {
    uint[] public newOriginal;

    function TestArray(){
    }

    function copy(){
        for(uint i = 1; i<5; i++){
            newOriginal[i]=2;
        }
    }
}