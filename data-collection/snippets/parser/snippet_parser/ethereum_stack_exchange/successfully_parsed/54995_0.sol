pragma solidity ^0.4.18;

contract testReset {

    uint public _num;

    constructor() public {
    }


    function _set(uint newnum) public {
        _num = newnum;
    }

    function _reset() public {
        _num = 0;
    }
}
