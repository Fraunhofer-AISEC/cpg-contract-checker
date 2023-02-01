pragma solidity ^0.4.0;

contract C {

    uint state_variable; 

    function test() returns uint{
        uint local_variable = 10; 
        return local_variable * state_variable;
    }
}
