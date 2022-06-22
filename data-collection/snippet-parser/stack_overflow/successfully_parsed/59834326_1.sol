
pragma solidity >=0.4.21 <0.6.0;

import "./A.sol";

contract B {
    A a;
    constructor(address addr) public {
        a = A(addr);
    }

    function add(uint n) public {
        a.add(n);
    }

    function nums() public view returns (uint) {
        return a.nums();
    }
}

