pragma solidity ^0.4.8;

contract parseBytes {
  bytes test = "\x20\x00\x10\x10\x10";
  function f(){
    bytes32 adr;
    assembly{
        adr := sha3(0, 32)
    }
  }
}
