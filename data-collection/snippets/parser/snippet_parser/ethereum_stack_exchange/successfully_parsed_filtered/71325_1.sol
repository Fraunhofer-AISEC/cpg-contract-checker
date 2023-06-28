pragma solidity 0.5.1;

contract SolArray {

    uint[] public a;

    function pushA(uint value) public {
        a.push(value);
    }
}
