pragma solidity ^0.4.3;

contract Precompile {
  function foo (bytes32, uint8, bytes32, bytes32) returns (address);
}

contract Testcontract {
  address last = 0x0;

  event Debug(string message, address res);

  Precompile prec = Precompile(0x0000000000000000000000000000000000000001);

  function testMe () {
    last = prec.foo("\x00", uint8(0), "\x00", "\x00");
    Debug("testMe()", last);
  }

}
