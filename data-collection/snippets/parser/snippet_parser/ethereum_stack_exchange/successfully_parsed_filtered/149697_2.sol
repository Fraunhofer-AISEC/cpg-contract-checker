pragma solidity ^0.8.0;

contract C {
    uint id;
    constructor(uint _id) {
        id = _id;
    }
}

contract CExt is C {
    constructor(uint _id) C(_id) { }
}


contract CExtChild is CExt(1) {}
