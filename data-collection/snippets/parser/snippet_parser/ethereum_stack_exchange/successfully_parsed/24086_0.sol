pragma solidity ^0.4.4;

contract SimpleEnum {
  enum SomeData {Channel}
  SomeData sd;

  function set_values(uint a) {
    sd.Channel = a
    return sd
  }
}
