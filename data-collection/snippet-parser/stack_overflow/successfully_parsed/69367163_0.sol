pragma solidity ^0.8.5;
contract C {

    uint c;

    uint store;

   function set(uint x) public {

             store = x * 42;
         }

  function g (uint a, uint b) public{

       require (a >= b);

       require (b >= c);

       assert (store(a) >= store(c));
   }
 }
