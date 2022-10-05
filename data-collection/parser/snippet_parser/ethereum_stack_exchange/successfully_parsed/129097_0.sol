pragma solidity ^0.8.9;

interface A {
    function foo() external returns (uint256);
    function bar() external returns (uint256);
}

contract B {
    function foo() public returns (uint256) {
        return 1;
    }
}

contract MyContract is A, B {
    function bar() public returns (uint256) {
        return 2;
    }
}
