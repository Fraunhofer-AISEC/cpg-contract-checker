function bar(uint baz) public {
    uint[] memory foo1 = new uint[](7); 
    uint[] storage foo2 = new uint[](7); 
    uint[] memory foo3 = new uint[](baz); 
    uint[] storage foo4 = new uint[](baz); 
}

