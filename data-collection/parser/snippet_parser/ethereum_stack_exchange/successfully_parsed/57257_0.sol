pragma solidity ^0.4.24;

contract Test {

    struct S {
        string s;
        uint u;
    }

    function returnTwoValues() private returns (string s, uint u) {
        s = "123";
        u = 123;
    }

    constructor() {
        S memory s = S(returnTwoValues());
    }
}
