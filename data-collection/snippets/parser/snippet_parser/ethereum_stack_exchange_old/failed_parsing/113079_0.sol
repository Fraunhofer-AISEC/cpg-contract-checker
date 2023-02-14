contract MyContract {
    function foo() internal view returns (uint memory) {
        return 0;
    }
    function bar() public {
        uint memory tmp = foo()
        ...
    }
}
