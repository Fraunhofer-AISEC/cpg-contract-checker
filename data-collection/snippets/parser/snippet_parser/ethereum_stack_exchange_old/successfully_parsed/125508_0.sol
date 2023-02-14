pragma solidity ^0.4.24;

interface A {
    function foo(uint256 _x) external pure returns(uint256);
}

contract B1 is A {
    function foo(uint256 _x) public pure returns(uint256) { return _x + 1; }
}

contract B2 is A {

}

contract C_OK is B1, B2 {
    function foo(uint256 _x) public pure returns(uint256) { return super.foo(_x); }
}

contract C_NOT_OK is B1, A {
    function foo(uint256 _x) public pure returns(uint256) { return super.foo(_x); }
}
