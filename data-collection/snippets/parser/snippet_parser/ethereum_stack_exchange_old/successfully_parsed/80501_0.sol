struct Example {
    uint a;
    uint b;
    uint c;
}

Example public example;

function set1(uint _a, uint _b, uint _c) public {
    example.a = _a;
    example.b = _b;
    example.c = _c;
}

function set2(uint _a, uint _b, uint _c) public {
    example = Example(_a, _b, _c);
}

function set3(uint _a, uint _b, uint _c) public {
    example = Example({a: _a, b: _b, c: _c});
}
