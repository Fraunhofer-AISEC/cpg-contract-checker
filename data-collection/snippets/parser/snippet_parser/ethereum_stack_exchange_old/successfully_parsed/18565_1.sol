pragma solidity ^0.4.0; 

    contract MyTest { 

        function myfunc(uint a) private returns (uint b) {
            b = a+1;
        }

        function first(uint a) constant returns (uint b) { 
            b = myfunc(a);
        }
    }
