

pragma solidity ^0.8.15;

contract A {

    uint public s_sum;
    uint public s_mul;

    function sum(uint a, uint b) public{
        s_sum =  a + b;
    }

    function mul(uint a, uint b) public {
        s_mul =  a * b;
    }

    function jointExec(uint a, uint b) public {
        sum(a,b);
        mul(a,b);
    }
}
