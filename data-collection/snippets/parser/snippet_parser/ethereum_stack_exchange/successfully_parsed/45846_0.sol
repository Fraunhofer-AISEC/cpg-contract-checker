pragma solidity ^0.4.10;

contract Foo {
    bool public lastVal = false;

    function fooFunc(bool x) public returns (bool) {
        lastVal = x;
        return !x;
    }
}

contract Bar {
    bool public barBool = false;
    Foo myFoo;

    function Bar(address _myFooAddr) public {
        myFoo = Foo(_myFooAddr);
    }

    function barFunc() public {
        barBool = myFoo.fooFunc(barBool);
    }
}
