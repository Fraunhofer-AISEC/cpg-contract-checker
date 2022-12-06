pragma solidity ^0.4.19;
pragma experimental ABIEncoderV2;
contract Tester {

    struct Foo {
        bool stayFalse;
    }

    function Tester() public {
    }

    function runTest() public constant returns (bool) {
        Foo memory foo;
        return one(foo);
    }

    function one(Foo memory foo) public constant returns (bool){
        Foo memory foobar;
        foobar = two(foo);
        return foo.stayFalse;
    }

    function two(Foo memory bar) public constant returns(Foo) {
        bar.stayFalse = true;
        return bar;
    }

}
