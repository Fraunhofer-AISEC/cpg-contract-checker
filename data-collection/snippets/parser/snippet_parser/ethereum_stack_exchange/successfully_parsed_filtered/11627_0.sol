pragma solidity ^0.4.8;

contract A {
    B public b;
    function foo() {
        b = new B();
        throw;
    }

    function getXfromB() returns (uint) {
        return b.x();
    }
}

contract B {
    uint public x;

    function B() {
        x = 1;
    }
}
