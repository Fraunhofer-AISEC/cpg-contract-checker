pragma solidity ^0.5.1;

contract testContract {

    uint value;

    constructor (uint _p) public {
        value = _p;
    }

    function setP(uint _n) payable public {
        value = _n;
    }

    function setNP(uint _n) public {
        value = _n;
    }

    function get () view public returns (uint) {
        return value;
    }
}
