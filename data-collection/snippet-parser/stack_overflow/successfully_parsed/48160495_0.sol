pragma solidity ^0.4.4;

contract Test {
    struct FooBar {
        uint8 foo;
        uint16 bar;
    }

    FooBar public fooBar;

    function getFooBar() public view returns(FooBar) {
        return fooBar;
    }

    function setFooBar(FooBar value) public {
        fooBar = value;
    }
}
