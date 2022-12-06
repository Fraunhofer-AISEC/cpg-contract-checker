pragma solidity ^0.4.19;


contract TestContract {

   uint [1000000] val;
   uint [200000] val2;


   function TestContract(){

   }

   function getValue()  external view returns(uint [1000000]){
         return val;
   }

   function getValue2()  external view returns(uint [200000]){
         return val2;
   }
}
