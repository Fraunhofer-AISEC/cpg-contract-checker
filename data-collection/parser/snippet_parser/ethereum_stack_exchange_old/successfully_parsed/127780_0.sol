pragma solidity ^0.8.0;

     

function taker(uint a, uint b) pure returns(uint s) {
     s = a + b;
     return s;
}
 

contract seeing {

     function see() public view returns (bool) {
        uint s = taker();
         return true;
         
     }
}
