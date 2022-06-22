pragma solidity ^0.4.24;


contract PureFunctionTest {

   uint state;

    function addNumbers(uint a, uint b) public pure returns (uint) {
       return a +b ;
   }

   function updateState(uint a, uint b) public {
       
     uint c = addNumbers(a,b);
     state = c;
   }

   function addThreeNumbers(uint a, uint b, uint c) public pure returns (uint) {
       
       uint temp = addNumbers(a,b);
       uint num  = addNumbers(temp,c);
       return num;
   }
}
