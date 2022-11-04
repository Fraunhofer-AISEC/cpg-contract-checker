       pragma solidity ^0.4.0;

       contract C {
               function f(uint a) private returns(uint b) { 
                             return a + 1;
               }

      }

     contract D {
              function readData() public {
                       C c = new C();
                       uint local = c.f(7); 

             }
    }
