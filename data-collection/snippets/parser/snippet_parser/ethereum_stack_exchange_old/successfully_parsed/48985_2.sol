pragma solidity ^0.4.22;

contract A{
    uint a;

    constructor (uint _a) public {
        a = _a;
    }
}

contract B is A{
    uint b;

    constructor (uint _a, uint _b) A(_a) public{
        b = _b;
    }
}

contract C is B{
    uint c;

    constructor(uint _a, uint _b, uint _c) B(_a, _b) public {
        c = _c;
    }
}
