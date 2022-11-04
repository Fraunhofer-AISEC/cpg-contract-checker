function foobar4(address a, uint[] _x) public {
    Bar memory b = Bar(a, _x);
    bars.push(b);
}
