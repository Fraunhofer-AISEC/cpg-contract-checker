
pragma solidity ^0.8.4;

interface IFoo {
    function foo (address) external view returns (uint);
}

contract Foo is IFoo {
    mapping (address => uint) public override foo;
}
