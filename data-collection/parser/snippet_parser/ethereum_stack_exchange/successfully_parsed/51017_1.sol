pragma solidity ^0.4.18;  
contract C {  
bytes32 public temp;  
function hashingsha3 (bytes s)   {  
temp= sha3(s);  
}  
function hashingsha256 (bytes s) {  
temp= sha256(s);  
}  
function kec (bytes s)  {  
temp= keccak256(s);  
}  
}
