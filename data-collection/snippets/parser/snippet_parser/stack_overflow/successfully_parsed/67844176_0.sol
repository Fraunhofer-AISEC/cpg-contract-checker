pragma solidity ^0.8.4;
contract C {
  function f(uint x, uint y) public pure {
    uint dummy = 0x1234567890;
    uint z = 0xdeadbeef;
    if (x != 0) {
      z = x * y;
    }
  }
}
