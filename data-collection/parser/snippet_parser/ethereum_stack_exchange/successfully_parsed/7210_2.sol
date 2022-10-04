function bar(uint baz) public {
    uint[7] memory foo1; 
    uint[7] storage foo2; 
    uint[baz] memory foo3; 
    uint[baz] storage foo4; 
}
