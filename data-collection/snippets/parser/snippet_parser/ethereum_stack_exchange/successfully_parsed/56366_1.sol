pragma solidity ^0.4.24;

contract Test {
    mapping(uint => mapping(uint => bool)) s;

    constructor() public {
        s[0][1] = true;
    }

    function readUser(uint A, uint B)
    public
    view
    returns(bool)
    {
        return s[A][B];
    }
}
