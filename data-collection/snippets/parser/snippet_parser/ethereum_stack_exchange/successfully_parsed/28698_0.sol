  pragma solidity ^0.4.18;
  contract TestInt {
    uint value1;
    function setVal(uint _value) public {
      value1 = _value + 10;
    }

    function getVal() public  returns (uint) {
      return value1;
    }

    int value2;
    function set2(int _value) public {
      value2 = _value + 10;
    }

    function get2() public  returns (int) {
      return value2;
    }
    uint value;
  } 
