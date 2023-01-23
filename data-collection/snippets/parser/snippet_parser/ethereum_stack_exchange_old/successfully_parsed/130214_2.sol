   function updateVar(uint256 myNewVar) external {
       assembly {
           sstore(0, myNewVar)
       }
   }
