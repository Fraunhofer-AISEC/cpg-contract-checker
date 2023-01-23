contract Test {
    struct Foo {
        uint a;
        string b;
        address c;
    }

    function bar (Foo memory foo) public {
        c = foo.c;
    }
}
