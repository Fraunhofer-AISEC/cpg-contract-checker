pragma solidity ^0.4.4;

contract Test {
    struct FooBar {
        uint8 foo;
        uint16 bar;
    }

    FooBar public fooBar;

    
    function setFooBar1(FooBar value) public {
        fooBar = value;
    }

    
    function setFooBar2(uint8 foo, uint16 bar) public {
        fooBar.foo = foo;
        fooBar.bar = bar;
    }
}
