pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;
contract Tester {
    struct Foo {
        bool stayFalse;
    }

    function Tester() public {
    }

    function runTest() public pure returns (bool, bool) {
        Foo memory foo;
        return one(foo);
    }

    function one(Foo memory foo) public pure returns (bool, bool){
        Foo memory foobar = two(clone(foo));
        return (foo.stayFalse, foobar.stayFalse);
    }

    function two(Foo memory bar) public pure returns (Foo) {
        bar.stayFalse = true;
        return bar;
    }

    function clone(Foo memory from) internal pure returns (Foo memory) {
        return Foo(from.stayFalse);
    }
}
