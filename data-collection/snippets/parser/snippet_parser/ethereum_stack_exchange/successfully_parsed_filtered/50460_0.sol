pragma solidity ^0.4.24;

library TestLibrary {
    function swapNumber(uint value1, uint value2) internal {
        value1 = value2;
    }
}

contract Test {
    uint public value1;
    uint public value2;

    constructor() public {
        value1 = 1;
        value2 = 2;
    }

    function swapNumberLib() public {
        TestLibrary.swapNumber(value1, value2);
    }

    function swapNumber() public {
        value1 = value2;
    }
}
