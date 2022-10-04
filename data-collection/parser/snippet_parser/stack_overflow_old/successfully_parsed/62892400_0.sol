    pragma solidity >=0.4.24 <0.6.0;
    contract Simple {
        function f(uint a) payable public{
        a += 1;
            if (a == 66 && a+3<100) {
               a = a+3;
            }
        }
    }
