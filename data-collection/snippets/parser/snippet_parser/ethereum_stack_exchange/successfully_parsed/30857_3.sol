function foobar3(address a) public {
    Bar memory b = Bar(a, new uint[](0)); 
    bars.push(b);
}
