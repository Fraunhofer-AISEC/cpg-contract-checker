pragma solidity ^0.4.15;

    contract C{

        function throws(){
            throw;
        }
        function reverts(){
            revert();
        }
        function requires(){
            require(false);
        }
        function asserts(){
            assert(false);
        }
    }
