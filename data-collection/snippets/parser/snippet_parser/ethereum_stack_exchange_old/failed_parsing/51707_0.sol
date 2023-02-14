pragma solidity ^0.4.24;

contract Test {
    constructor(uint size) {
        uint[size] storage arr;
        for (uint i = 0; i < size; i++) { arr[i] = 0 }
    }
}
