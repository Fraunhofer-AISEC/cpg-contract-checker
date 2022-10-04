pragma solidity >=0.4.22 <0.9.0;

contract Mystery {

  uint32 private currentValue = 100;

  function returnAndIncrement () public returns (uint32 value) {
    value = currentValue;
    currentValue = currentValue + 1;
    return value;
  }
}
