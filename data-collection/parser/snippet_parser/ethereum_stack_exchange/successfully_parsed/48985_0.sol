contract A{
    uint a;

    constructor (uint _a) public {
        a = _a;
    }
}

contract B is A{
    uint b;

    constructor (uint _a, uint _b) public{
        A(_a);
        b = _b;
    }
}

contract C is B{
    uint c;

    constructor(uint _a, uint _b, uint _c) public {
        B(_a, _b);
        c = _c;
    }
}
