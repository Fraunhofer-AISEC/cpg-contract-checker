pragma solidity ^0.4.16;

contract Foo {
  uint public result;
  function bar(bytes3[2]) public pure {}
  function baz(uint32 x, bool y) public pure returns (bool r) { result = x; return y; }
  function sam(bytes, bool, uint[]) public pure {}
}
