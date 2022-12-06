pragma solidity ^0.4.16;

  contract Test {

    bytes32 public input;
    function test(bytes32 _in) public {
    input = _in;
  }
}
