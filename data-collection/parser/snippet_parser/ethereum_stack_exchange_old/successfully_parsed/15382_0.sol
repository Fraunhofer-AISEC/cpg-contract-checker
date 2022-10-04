pragma solidity ^0.4.0;
contract Test {

   function Test() {
       intfunc(5);
   }

   uint8 store;

   function intfunc (uint8 a) internal {
       store = a * 9;
   }
}
