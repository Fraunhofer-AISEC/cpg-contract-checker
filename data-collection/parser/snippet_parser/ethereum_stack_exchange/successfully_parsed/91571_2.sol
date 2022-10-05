function getMultipleFoo() public pure returns (Foo[] memory) {
        Foo[3] multipleFoo;
        Foo memory _foo = Foo("id", "name");
        multipleFoo[0] = _foo;
        multipleFoo[1] = _foo;
        multipleFoo[2] = _foo;
        return multipleFoo;
    }
