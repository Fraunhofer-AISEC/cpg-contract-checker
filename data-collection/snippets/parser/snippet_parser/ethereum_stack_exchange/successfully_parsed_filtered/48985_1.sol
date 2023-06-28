pragma solidity ^0.4.22;

contract Base {
    uint x;
    constructor(uint _x) public { x = _x; }
}

contract Derived2 is Base {
    constructor(uint _y) Base(_y * _y) public {}
}
