contract Test {
    function f() public returns(uint r) {
        uint x = 100;
        assembly {
            function f(x) -> y { y := add(x, 1) }
            r := f(100)
        }
    }
}
