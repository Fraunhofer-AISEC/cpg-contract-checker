contract Foo {

    uint256 public foo;

    function setFoo(uint256 _foo) public {
        foo = _foo;
    }

    function setFooToZero() public {
        foo = 0;
    }
}
