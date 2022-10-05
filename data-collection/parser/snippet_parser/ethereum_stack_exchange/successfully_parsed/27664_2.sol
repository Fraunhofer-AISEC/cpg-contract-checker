contract Base {
    uint x;
    constructor(uint _x) public { x = _x; }
}


contract Derived1 is Base(7) {
    constructor() public {}
}


contract Derived2 is Base {
    constructor(uint _y) Base(_y * _y) public {}
}
