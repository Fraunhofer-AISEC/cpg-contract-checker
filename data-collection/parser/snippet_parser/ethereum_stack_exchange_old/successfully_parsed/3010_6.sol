
pragma solidity ^0.4.23;
contract Ctrt {
    uint public numerator;
    uint public denominator;
    uint public quotient;
    uint public remainder;
    constructor() public {
      numerator = 100;
      denominator = 3;
    }
    function setNumbers(uint _numerator, uint _denominator) public {
      numerator = _numerator;
      denominator = _denominator;
    }
    function safeDiv(uint _numerator, uint _denominator) public {
      quotient = _numerator / _denominator;
      remainder = _numerator - quotient * _denominator;
    }
    function safeDivDefault() public {
      quotient = _numerator / _denominator;
      remainder = _numerator - quotient * _denominator;
      
    }
}
