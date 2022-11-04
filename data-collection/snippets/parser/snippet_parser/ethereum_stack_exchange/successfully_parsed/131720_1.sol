
pragma solidity ^0.7.1;

function bar(uint256 a, uint256 b) pure returns (uint256) {
    return a + b;
}

contract AA {
    uint256 public a;

    constructor() {
        a = 1234;
    }

    function foo() public view returns (uint256) {
        return bar(a, 1000);
    }
}
