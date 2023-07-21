contract Foo {
    function bar (uint num) external  {
        if (num <= 10) {
            revert();
        }
    }
}
