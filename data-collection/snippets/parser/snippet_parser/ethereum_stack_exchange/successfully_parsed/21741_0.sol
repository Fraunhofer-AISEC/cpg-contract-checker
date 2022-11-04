pragma solidity ^0.4.13;

contract A {
    uint public counter ; 
    function increment(uint add) {
       counter = counter + add;
    }
}

contract B {
    function delegateIncrement(uint add) {
        A(addressA).increment(add) ; 
    }
}
