pragma solidity ^0.4.24;

contract Second {
    int32 public _nRes2;

    constructor() public {
        _nRes2 = 15;
    }
    function State() public {
        _nRes2 = 17;
    }
}
