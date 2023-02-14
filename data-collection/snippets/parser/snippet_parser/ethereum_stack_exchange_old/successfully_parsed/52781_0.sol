  pragma solidity ^0.4.9;

  contract Math {

    function Math() public {}

    function percent(uint a, uint b) public constant returns(uint, uint) {
      uint c = a*b;
      uint integer = c/100;
      uint fractional = c%100;
      return (integer, fractional);
    }

  }
