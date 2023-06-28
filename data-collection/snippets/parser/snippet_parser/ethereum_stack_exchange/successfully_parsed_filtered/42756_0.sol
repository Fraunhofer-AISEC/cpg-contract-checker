pragma solidity ^0.4.21;

contract Foo {
    struct Bar {
        bytes32 a;
        uint8[9] b;
    }

    Bar[] public bars;

    function add(bytes32 _a, uint8[9] _b) public {
        bars.push(Bar(_a, _b));
    }
}
