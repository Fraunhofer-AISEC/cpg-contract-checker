
pragma solidity >=0.4.21 <0.6.0;

contract A {
    uint num;
    constructor(uint n) public {
        num = n;
    }

    function add(uint n) public {
        num += n;
    }

    function nums() public view returns (uint) {
        return num;
    }
}

