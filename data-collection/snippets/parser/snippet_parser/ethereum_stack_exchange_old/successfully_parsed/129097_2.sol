pragma solidity ^0.8.9;

interface A {
    function foo() external returns (uint256);
    function bar() external returns (uint256);
}

abstract contract B is A {
    function foo() public returns (uint256) {
        return 1;
    }
}

contract MyContract is B {
    function bar() public override returns (uint256) {
        return 2;
    }
}
