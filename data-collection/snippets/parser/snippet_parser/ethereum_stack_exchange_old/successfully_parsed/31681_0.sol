pragma solidity ^0.4.15;
  contract EventTest {
    event AnyException(string message);

    function testEvent(string s) public returns (bool) {
      if (keccak256(s) == keccak256("titu")) {
        AnyException("Invalid input: titu");
        return false;
      }
      return true;
    }
  }
