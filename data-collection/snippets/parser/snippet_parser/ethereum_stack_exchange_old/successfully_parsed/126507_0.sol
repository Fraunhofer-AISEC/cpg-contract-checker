
pragma solidity ^0.8.7;

struct AB {
  uint8 a;
  uint8 b;
}

contract TheContract {
  function add(AB memory ab) public pure returns(uint8) {
    return ab.a + ab.b;
  }
}

library TheLibrary {
  function add(AB memory ab) public pure returns(uint8) {
    return ab.a + ab.b;
  }
}
