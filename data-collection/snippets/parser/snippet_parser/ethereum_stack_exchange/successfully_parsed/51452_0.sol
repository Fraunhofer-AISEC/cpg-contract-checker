pragma solidity ^0.4.0;

contract C {
    uint public number1;
    uint public number2;

    function incOne() public view {
        inc(number1);
    }

    function incTwo() public view {
        inc(number2);
    }

    function inc(uint storage d) internal pure {
        d += 1;                                         
    }
}
