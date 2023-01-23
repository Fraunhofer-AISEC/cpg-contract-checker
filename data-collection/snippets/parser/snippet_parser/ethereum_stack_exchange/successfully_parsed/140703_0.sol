pragma solidity ^0.8.0;

contract Reverse{

    function reverse(bytes32 pad) pure public returns(bytes memory){
        bytes memory reversePad;
        for(uint i=32;i>0;i--){
            reversePad[32-i]=pad[i];
        }
    }
}
