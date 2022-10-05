pragma solidity ^0.5.0;

import { C1 } from './C1.sol';

contract C2 {
    C1 c1;
    constructor(address _c1) public {
        c1 = C1(_c1);
    }

    function setX(int _x) public {
        c1.setX(_x);
    }

    function getX() public view returns (int) {
        c1.getX();
    }
}
