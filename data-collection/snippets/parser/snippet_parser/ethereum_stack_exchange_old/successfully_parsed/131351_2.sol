pragma solidity 0.8.14;

contract StructMapping {

    struct Foo {
        mapping(uint => uint) bars;
    }

    mapping(address => Foo) public fooBars;
}
