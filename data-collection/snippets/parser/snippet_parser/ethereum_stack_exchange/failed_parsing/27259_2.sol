contract A {
    struct Thing {
        uint x;
        uint y;
        uint z;
    }
    mapping(uint => Thing) public foo;
    ...
}
