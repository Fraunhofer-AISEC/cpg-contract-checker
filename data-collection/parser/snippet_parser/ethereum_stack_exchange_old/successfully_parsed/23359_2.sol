pragma solidity ^0.4.11;

contract Sub {
 bytes32 one;
 function set(bytes32 _one) {
    one = _one;
 }

 function get() constant returns(bytes32) {
     return one;
 } 
}
