pragma solidity ^0.4.8;

contract example {

 Bytes16 source=0xa9c40ddcb43ebbc83add97b8f9f361f1;

 function returnByte(uint k) returns (bytes1 a) {
    a = source[k];
    return a;       
 }

}
