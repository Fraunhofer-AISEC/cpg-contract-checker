

pragma solidity ^0.8.0;

contract funTesting {

function add(uint x, uint y) public pure returns(uint) {
    uint sum;
  
    x = x+10;

    sum = x + y;
    sum = sum * getValueToAdd(2);
    return sum;
}

function getValueToAdd(uint num) public pure returns(uint) {

    uint value = num*10;
    return value;
}
} 

contract Dummy {

 function dummy(uint a) public pure returns(uint) {
     uint _a = a; return _a; 
     }
     
}
 
