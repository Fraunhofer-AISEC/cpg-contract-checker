 pragma solidity ^0.4.0;

    contract test {
        event test_value(uint256 indexed value1);
        uint256 value_test;

        function test_f()  {

            
            test_value(value_test); 
        }
    }
