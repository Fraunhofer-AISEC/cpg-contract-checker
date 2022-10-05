  pragma ^0.4.24;
  contract A {
        function returnRandom(uint256 a) pure public returns (uint256) {
           if(a == 2) {
              return 5;
           }   
        }
  }
