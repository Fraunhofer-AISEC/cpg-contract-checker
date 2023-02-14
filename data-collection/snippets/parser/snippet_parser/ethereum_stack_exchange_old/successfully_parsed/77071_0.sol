pragma solidity >=0.4.24 <0.6.0;
contract TestContract{

   uint public a;

   constructor() public 
   { 
       a = 2;
   }

   function addNumber(uint b) public
   {
       a = a + b;
   }

   function read() public view returns (uint)
   {
       return a;
   }
}
