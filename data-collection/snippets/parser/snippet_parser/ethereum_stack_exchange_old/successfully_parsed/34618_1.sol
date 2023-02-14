pragma solidity ^0.4.13;

import "./z3.sol";

contract z2 is z3{

    function z2 (){}

    function createZ3() returns(z3){
        z3 newZ3 = new z3();
        return newZ3;
    }



}
