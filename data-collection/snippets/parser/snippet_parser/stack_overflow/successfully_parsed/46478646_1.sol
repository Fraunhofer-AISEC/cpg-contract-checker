pragma solidity ^0.4.0;

contract B {
    function B() payable {}
}

contract A {
    address child;

    function test() {
        child = (new B).value(10)(); 
    }
}
