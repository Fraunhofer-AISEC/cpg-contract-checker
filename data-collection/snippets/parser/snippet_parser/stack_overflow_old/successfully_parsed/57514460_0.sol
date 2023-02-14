pragma solidity ^0.5.0;

contract sample {

    uint number;
    constructor () public {
        number = 5;
    }
    function getNum () public view returns (uint) {
        return number;
    }

    function setNum (uint n) public {
        number = n;
    }
}
