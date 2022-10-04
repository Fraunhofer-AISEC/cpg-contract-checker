pragma solidity ^0.4.13;

import "./z2.sol";

contract z1 {

    uint example;

    function z1 (){ example = 33;}


    function createZ2() returns(z2){
        z2 newZ2 = new z2();
        return newZ2;
    }

    function getZ1example() returns(uint){
        return example;
    }

}
