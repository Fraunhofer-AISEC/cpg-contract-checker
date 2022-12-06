pragma solidity ^0.4.24;

contract Test {

    struct S {
        string s;
        uint u;
    }

    function returnOneValue() private pure returns (S s) {
        s.s = "123";
        s.u = 123;
    }

    constructor() {
        S memory s = returnOneValue();
    }
}
