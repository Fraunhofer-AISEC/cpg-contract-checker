pragma solidity ^0.4.15;

contract B {

    function plus(uint a, uint b) internal returns (uint) {
        return a + b;
    }

    function minus(uint a, uint b) internal returns (uint) {
        return a - b;
    }

    function eval(function (uint, uint) internal returns (uint) f, uint x, uint y) internal returns (uint) {
        return f(x, y);
    }

    function calc(uint op, uint x, uint y) constant public returns (uint) {
        function (uint, uint) internal returns (uint) g;
        if (op == 0) {
            g = plus;
        } else if (op == 1) {
            g = minus;
        }
        return eval(g, x, y);
    }
}
