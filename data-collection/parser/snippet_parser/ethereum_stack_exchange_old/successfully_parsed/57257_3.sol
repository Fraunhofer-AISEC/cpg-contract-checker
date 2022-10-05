pragma solidity ^0.4.24;

contract Test {

    struct S {
        string s;
        uint u;
    }

    function returnTwoValues() private pure returns (string s, uint u) {
        s = "123";
        u = 123;
    }

    constructor() public {
        (string memory _s, uint _u) = returnTwoValues();
        S memory s = S(_s, _u);
    }
}
