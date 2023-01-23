pragma solidity ^0.5.7;

    contract Test {
        function test() public view  returns (uint){
             return 10*10;
        }

        function test2() external view  returns (uint){
             return 10*2;
        }
    }
